# SmallMGC Web 配置管理

通过网页表单管理 `configuration.xml`(MGC IP/端口、网关、注册号码),保存后自动重启 smallmgc 容器使配置生效。

## 功能

- **查看/编辑配置**:结构化表单(MGC 段 + 网关段 + 号码增删改),不会写坏 XML 结构
- **保存**:写回 configuration.xml(保留全部注释),自动备份旧配置为 `configuration.xml.bak_web`
- **重启**:保存后自动 `podman restart` smallmgc 容器;也可单独点"仅重启"

## 运行

```bash
cd web-admin
python3 -m venv venv                # 首次:创建虚拟环境
./venv/bin/pip install -r requirements.txt   # 首次:安装依赖
./venv/bin/python app.py            # 启动(默认 http://0.0.0.0:8080)
```

浏览器访问 `http://<服务器IP>:8080`

## 环境变量(可选)

| 变量 | 默认值 | 说明 |
|---|---|---|
| `SMALLMGC_CONFIG` | `../docker-deploy/runtime/configuration.xml` | 配置文件路径 |
| `SMALLMGC_CONTAINER` | `docker-deploy_smallmgc_1` | 重启的容器名 |
| `WEB_HOST` / `WEB_PORT` | `0.0.0.0` / `8080` | 监听地址/端口 |

## 安全提示

- 局域网管理工具,**无认证**,请勿暴露到公网;
- 保存会重启 smallmgc(短暂中断呼叫),页面有确认提示;
- 每次保存自动备份,出错可用 `configuration.xml.bak_web` 恢复。
