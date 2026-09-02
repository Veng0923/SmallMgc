#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
SmallMGC Web 配置管理服务
- 读取/编辑 configuration.xml(结构化表单,保留注释)
- 保存配置
- 重启 smallmgc 容器使配置生效

运行: python3 app.py  (默认 0.0.0.0:8080)
依赖: flask, lxml  (见 requirements.txt)
"""
import os
import subprocess
import shutil
import functools
from pathlib import Path

from flask import Flask, render_template, request, redirect, url_for, flash, session
from lxml import etree

# ---------------- 配置 ----------------
BASE_DIR = Path(__file__).resolve().parent
# 配置文件路径(默认部署目录;可用环境变量覆盖)
CONFIG_PATH = Path(os.environ.get("SMALLMGC_CONFIG",
                                  BASE_DIR.parent / "docker-deploy" / "runtime" / "configuration.xml"))
# 重启的容器名(默认 docker-deploy 编排的容器)
CONTAINER_NAME = os.environ.get("SMALLMGC_CONTAINER", "smallmgc")
HOST = os.environ.get("WEB_HOST", "0.0.0.0")
PORT = int(os.environ.get("WEB_PORT", "8080"))
# 登录凭据(务必通过环境变量修改默认密码)
WEB_USER = os.environ.get("WEB_USER", "admin")
WEB_PASSWORD = os.environ.get("WEB_PASSWORD", "admin")

app = Flask(__name__)
app.secret_key = os.environ.get("WEB_SECRET", "smallmgc-web-admin")  # flash/session 用


def login_required(view):
    """未登录跳转登录页"""
    @functools.wraps(view)
    def wrapped(*args, **kwargs):
        if not session.get("logged_in"):
            return redirect(url_for("login", next=request.path))
        return view(*args, **kwargs)
    return wrapped


# ---------------- XML 读写 ----------------
def load_config():
    """解析 configuration.xml,返回 (etree tree, 错误信息或 None)"""
    try:
        tree = etree.parse(str(CONFIG_PATH))
        return tree, None
    except Exception as e:
        return None, f"解析配置文件失败: {e}"


def get_mgc(root):
    """提取 MGC 配置(可编辑字段)"""
    mgc = root.find("mgc")
    if mgc is None:
        return {}
    return {
        "name": (mgc.findtext("name") or "").strip(),
        "h248": (mgc.findtext("ip/h248") or "").strip(),
        "h248port": (mgc.findtext("ip/h248port") or "").strip(),
        "callcontrol": (mgc.findtext("callcontrol") or "").strip(),
        "digitmap": (mgc.findtext("digitmap") or "").strip(),
    }


def get_gateways(root):
    """提取网关列表(可编辑字段 + 号码)"""
    gateways = []
    for gw in root.findall("gateway"):
        subs = []
        pstn = gw.find("terminations/pstn")
        if pstn is not None:
            for sub in pstn.findall("subscriber"):
                subs.append({
                    "id": (sub.findtext("id") or "").strip(),
                    "number": (sub.findtext("number") or "").strip(),
                })
        gateways.append({
            "name": (gw.findtext("name") or "").strip(),
            "h248": (gw.findtext("ip/h248") or "").strip(),
            "h248port": (gw.findtext("ip/h248port") or "").strip(),
            "callcontrol": (gw.findtext("callcontrol") or "").strip(),
            "profile": (gw.findtext("profile") or "").strip(),
            "subscribers": subs,
        })
    return gateways


def set_text(parent, tag, value):
    """设置/创建子元素文本"""
    el = parent.find(tag)
    if el is None:
        el = etree.SubElement(parent, tag)
    el.text = value.strip()


def save_config(form):
    """按表单内容更新配置并写回文件"""
    tree, err = load_config()
    if tree is None:
        return False, err
    root = tree.getroot()

    # ---- MGC 段 ----
    mgc = root.find("mgc")
    if mgc is None:
        return False, "配置缺少 <mgc> 段"
    set_text(mgc, "name", form.get("mgc_name", ""))
    set_text(mgc.find("ip"), "h248", form.get("mgc_h248", ""))
    set_text(mgc.find("ip"), "h248port", form.get("mgc_h248port", "2944"))
    # 数图仅在表单提交时更新(仅 n/ETSI 流程显示并提交;其他流程保留原值)
    if "mgc_digitmap" in form:
        set_text(mgc, "digitmap", form.get("mgc_digitmap", ""))
    set_text(mgc, "callcontrol", form.get("mgc_callcontrol", "a"))
    # ETSI(n) 流程下发 DigitMap 描述符,数图不能为空
    if "n" in form.get("mgc_callcontrol", "") and (mgc.findtext("digitmap") or "").strip() == "":
        return False, "ETSI(n) 流程必须填写数图模板"

    # ---- 网关段(按表单索引重建 pstn 号码) ----
    gateway_ids = [k for k in form.keys() if k.startswith("gw_name_")]
    gateway_ids.sort(key=lambda k: int(k.split("_")[-1]))
    gw_nodes = root.findall("gateway")
    for idx, gk in enumerate(gateway_ids):
        i = int(gk.split("_")[-1])
        if idx < len(gw_nodes):
            gw = gw_nodes[idx]
        else:
            gw = etree.SubElement(root, "gateway")
            gw_nodes.append(gw)
        set_text(gw, "name", form.get(f"gw_name_{i}", ""))
        ip = gw.find("ip")
        if ip is None:
            ip = etree.SubElement(gw, "ip")
        set_text(ip, "h248", form.get(f"gw_h248_{i}", ""))
        set_text(ip, "h248port", form.get(f"gw_h248port_{i}", "2944"))
        set_text(gw, "callcontrol", form.get(f"gw_callcontrol_{i}", "a"))

        # 重建 pstn 号码(保留 isdn/pri 不动)
        # 不依赖连续索引: 兼容页面删除行导致的索引断档
        terms = gw.find("terminations")
        if terms is None:
            terms = etree.SubElement(gw, "terminations")
        pstn = terms.find("pstn")
        if pstn is None:
            pstn = etree.SubElement(terms, "pstn")
        for old in pstn.findall("subscriber"):
            pstn.remove(old)
        sub_fields = [(k, v) for k, v in form.items()
                      if k.startswith(f"gw{i}_sub_id_")]
        sub_fields.sort(key=lambda kv: int(kv[0].rsplit("_", 1)[-1]))
        for k, v in sub_fields:
            j = int(k.rsplit("_", 1)[-1])
            sub_num = form.get(f"gw{i}_sub_num_{j}", "")
            if v.strip() == "" and sub_num.strip() == "":
                continue
            sub = etree.SubElement(pstn, "subscriber")
            etree.SubElement(sub, "id").text = v.strip()
            etree.SubElement(sub, "number").text = sub_num.strip()

    # 多余网关节点删除
    for extra in gw_nodes[len(gateway_ids):]:
        root.remove(extra)

    # ---- 写回(保留注释、缩进) ----
    try:
        etree.indent(root, space="    ")
        data = etree.tostring(tree, encoding="utf-8",
                              xml_declaration=True, pretty_print=True)
        # 备份旧配置
        backup = CONFIG_PATH.with_suffix(".xml.bak_web")
        shutil.copy2(CONFIG_PATH, backup)
        CONFIG_PATH.write_bytes(data)
    except Exception as e:
        return False, f"写配置文件失败: {e}"
    return True, "配置已保存"


def restart_smallmgc():
    """重启 smallmgc 容器使配置生效
    优先走容器运行时 socket(Docker SDK,兼容 Docker/Podman),
    失败则回退到 docker/podman CLI。
    """
    # ---- 方式1: Docker SDK(unix socket) ----
    sock_candidates = [
        "unix:///var/run/docker.sock",               # Docker(容器内挂载)/ 本机 root
        "unix:///run/user/1000/podman/podman.sock",  # Podman rootless
        "unix:///run/podman/podman.sock",            # Podman root
    ]
    try:
        import docker
        for base_url in sock_candidates:
            sock_path = base_url.replace("unix://", "")
            if not os.path.exists(sock_path):
                continue
            try:
                client = docker.DockerClient(base_url=base_url, timeout=10)
                c = client.containers.get(CONTAINER_NAME)
                c.restart(timeout=20)
                return True, f"容器 {CONTAINER_NAME} 已重启(socket API)"
            except docker.errors.NotFound:
                return False, f"容器 {CONTAINER_NAME} 不存在(检查 SMALLMGC_CONTAINER)"
            except Exception:
                continue  # 尝试下一个 socket
    except ImportError:
        pass

    # ---- 方式2: CLI(docker / podman) ----
    for cli in ("docker", "podman"):
        try:
            r = subprocess.run([cli, "restart", CONTAINER_NAME],
                               capture_output=True, text=True, timeout=30)
            if r.returncode == 0:
                return True, f"容器 {CONTAINER_NAME} 已重启({cli})"
            return False, f"重启失败: {r.stderr.strip() or r.stdout.strip()}"
        except FileNotFoundError:
            continue
        except Exception as e:
            return False, f"重启异常: {e}"
    return False, "未找到可用的容器运行时(需挂载 docker.sock / podman.sock,或安装 docker/podman CLI)"


# ---------------- 路由 ----------------
@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        if (request.form.get("username", "") == WEB_USER
                and request.form.get("password", "") == WEB_PASSWORD):
            session["logged_in"] = True
            return redirect(request.args.get("next") or url_for("index"))
        flash("用户名或密码错误", "error")
    return render_template("login.html")


@app.route("/logout")
def logout():
    session.clear()
    flash("已退出登录", "success")
    return redirect(url_for("login"))


@app.route("/")
@login_required
def index():
    root, err = load_config()
    if err:
        return render_template("index.html", error=err)
    return render_template("index.html",
                           mgc=get_mgc(root),
                           gateways=get_gateways(root),
                           config_path=CONFIG_PATH)


@app.route("/save", methods=["POST"])
@login_required
def save():
    ok, msg = save_config(request.form)
    flash(msg, "success" if ok else "error")
    if ok:
        # 保存成功后重启容器使配置生效
        ok2, msg2 = restart_smallmgc()
        flash(msg2, "success" if ok2 else "error")
    return redirect(url_for("index"))


@app.route("/restart", methods=["POST"])
@login_required
def restart():
    ok, msg = restart_smallmgc()
    flash(msg, "success" if ok else "error")
    return redirect(url_for("index"))


if __name__ == "__main__":
    print(f"SmallMGC Web 管理: http://{HOST}:{PORT}")
    print(f"配置文件: {CONFIG_PATH}")
    print(f"管理容器: {CONTAINER_NAME}")
    app.run(host=HOST, port=PORT, debug=False)
