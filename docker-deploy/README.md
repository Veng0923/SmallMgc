# SmallMGC 0.043.000 部署说明

## 目录结构

```
docker-deploy/
├── Dockerfile              # 部署镜像(基于编译镜像,含全部 32 位运行库)
├── docker-compose.yml      # 部署编排(smallmgc host 网络 + web-admin 管理)
├── build.sh                # 一键构建脚本
├── web-admin/              # Web 配置管理(独立镜像,见 web-admin/README.md)
└── runtime/                # ★ 部署时挂载的运行目录
    ├── configuration.xml   #   部署配置(修改后重启容器生效)
    └── profile_default.xml #   profile 文件(缺失会导致启动崩溃,勿删)
```

> runtime/ 里还会自动生成 test.db / calls.db(SQLite 数据库,持久化在宿主机)。

## 部署步骤

```bash
cd docker-deploy
./build.sh                    # 拷贝 Release 二进制并构建 smallmgc-deploy 镜像
docker compose up -d          # 启动(smallmgc + web-admin)
docker compose logs -f        # 查看日志
```

> 同时启动两个服务:
> - `smallmgc`:H.248 服务器(host 网络,监听配置的 mgc.ip.h248:2944)
> - `web-admin`:配置管理界面(http://服务器IP:8080,保存配置后自动重启 smallmgc)
>
> 两个服务都用了 `container_name` 固定容器名(`smallmgc` / `smallmgc-webadmin`),
> web-admin 通过挂载的 docker.sock(Podman 用 podman.sock)重启 smallmgc。
> Docker 环境用 `docker compose`,Podman 环境用 `podman-compose`(Podman 下
> 需把 socket 挂载路径改为 podman.sock)。

## 镜像依赖关系(重要)

本项目的两个镜像有**依赖关系**:

```
smallmgc-build(编译镜像)  ←── 部署镜像 Dockerfile 里 FROM smallmgc-build
       │                      因此构建 smallmgc-deploy 之前必须先有 smallmgc-build
       ▼
smallmgc-deploy(部署镜像)
```

- **`smallmgc-build`**:编译/构建环境(Ubuntu 10.04 + gcc 4.4 + 全部 32 位运行库),在 `docker-build/` 目录构建;
- **`smallmgc-deploy`**:运行时镜像,基于 smallmgc-build,只多了 smallmgc 可执行文件,在 `docker-deploy/` 目录构建。

**⚠️ 如果把 `smallmgc-build` 镜像删了(清理磁盘等),部署镜像无法直接重建**——报错:
`short-name "smallmgc-build:latest" did not resolve to an alias`。
必须按下面的"完整重建"顺序来。

## 构建与启动

### 首次构建 / 完整重建(含镜像被删后的恢复)

```bash
# 1. 重建编译镜像(如果 smallmgc-build 不存在或已删除)
cd /home/lsf/下载/smallmgc_0.043.000/smallmgc/docker-build
podman build -t smallmgc-build:latest .

# 2. 构建部署镜像(拷贝 Release 二进制 → 构建)
cd /home/lsf/下载/smallmgc_0.043.000/smallmgc/docker-deploy
./build.sh        # 等价于: cp ../Release/smallmgc ./smallmgc && podman build -t smallmgc-deploy:latest .

# 3. 启动
podman-compose up -d
podman-compose logs -f
```

> `./build.sh` 会先把 `../Release/smallmgc`(已验证的 32 位可执行文件)拷到 docker-deploy/ 再构建镜像,所以**请先确保 Release/smallmgc 存在**(重新编译见 `docker-build/` 的说明)。

### 日常更新(只改配置)

```bash
# 修改 runtime/configuration.xml 后:
podman-compose restart
```

### 镜像检查

```bash
podman images | grep smallmgc
# 期望看到: localhost/smallmgc-build 和 localhost/smallmgc-deploy
```

## 关键配置(runtime/configuration.xml)

| 配置项 | 说明 |
|---|---|
| `mgc.ip.h248` | **部署服务器真实 IP**(MGC 绑定地址,也是 Reply 头 MID,模拟网关必须能到达) |
| `gateway[i].ip.h248` | 模拟网关地址(与网关消息头里的 MID 一致) |
| `gateway[i].terminations.pstn.subscriber` | 注册号码(id = 网关上报的 Termination ID, number = 电话号码) |

## 服务器分发

### 方式一:服务器上构建(推荐)

把**整个项目目录**传到服务器(至少包含 `Release/smallmgc`、`docker-build/`、`docker-deploy/`),然后按"完整重建"步骤执行。

### 方式二:直接分发镜像(服务器不构建)

```bash
# 本机导出(两个镜像都要,或只导出 deploy)
podman save localhost/smallmgc-deploy:latest | gzip > smallmgc-deploy.tar.gz

# 服务器导入
gunzip -c smallmgc-deploy.tar.gz | podman load
```

> 若用 Docker 而非 Podman,把 `podman` 换成 `docker` 即可。

## 注意事项

1. **网络**:host 网络模式,MGC 直接绑定 `mgc.ip.h248`。部署服务器必须能 ping 通模拟网关(双向),否则 Reply 到不了(模拟网关不在局域网时需配路由/转发)。
2. **profile 文件**:`runtime/profile_default.xml` 必须存在(程序从工作目录读 `./profile_default.xml`,缺失会 `Poco::NullPointerException` 崩溃)。
3. **数据库**:test.db / calls.db 自动生成在 `runtime/`(SQLite,持久化在宿主机,删除后重启会自动重建)。
4. **日志**:日志输出到容器 stdout(`podman-compose logs -f` 查看),同时写 `runtime/smallmgc.log`。
5. **已知问题**:
   - 模拟网关**高频发包**(每秒几百个)时,gateway 处理任务偶发卡死 → 重启容器恢复;建议模拟网关发包频率 ≤ 2 秒/个。
   - 消息头 `MEGACO/1 [IP]` 与 `!/1 [IP]` 均可解析,但 APG 解析器偶发解析失败(重发即恢复)。
   - ISDN 功能已禁用(-DNO_ISDN 编译),不影响 H.248。
