# SmallMGC Web 配置管理

通过网页表单管理 `configuration.xml`(MGC IP/端口、网关、注册号码),保存后自动重启 smallmgc 容器使配置生效。

## 功能

- **查看/编辑配置**:结构化表单(MGC 段 + 网关段 + 号码增删改),不会写坏 XML 结构
- **保存**:写回 configuration.xml(保留全部注释),自动备份旧配置为 `configuration.xml.bak_web`
- **重启**:保存后自动重启 smallmgc 容器;也可单独点"仅重启"(通过 docker.sock / podman.sock 的 Docker API,兼容 Docker 与 Podman)

## 运行方式一:宿主机直接运行(开发调试)

```bash
cd web-admin
python3 -m venv venv                # 首次:创建虚拟环境
./venv/bin/pip install -r requirements.txt   # 首次:安装依赖
./venv/bin/python app.py            # 启动(默认 http://0.0.0.0:8080)
```

## 运行方式二:容器化(推荐,随 docker-deploy 一起部署)

已集成在 `docker-deploy/docker-compose.yml`,与 smallmgc 一起启动:

```bash
cd docker-deploy
docker compose up -d                # 同时启动 smallmgc + web-admin
```

- 镜像构建:`web-admin/Dockerfile`(基于 python:3.12-slim,清华 pip 源)
- 容器通过挂载的 **docker.sock**(Podman 用 podman.sock)调用 Docker API 重启 smallmgc 容器
- 端口:8080

## 环境变量(可选)

| 变量 | 默认值 | 说明 |
|---|---|---|
| `SMALLMGC_CONFIG` | `../docker-deploy/runtime/configuration.xml` | 配置文件路径 |
| `SMALLMGC_CONTAINER` | `smallmgc` | 重启的容器名(compose 已用 container_name 固定) |
| `WEB_HOST` / `WEB_PORT` | `0.0.0.0` / `8080` | 监听地址/端口 |

## 安全提示

- 局域网管理工具,**无认证**,请勿暴露到公网;
- ⚠️ 容器化部署挂载了 docker.sock,容器可控制宿主所有容器——仅限可信内网;
- 保存会重启 smallmgc(短暂中断呼叫),页面有确认提示;
- 每次保存自动备份,出错可用 `configuration.xml.bak_web` 恢复。
