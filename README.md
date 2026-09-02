# SmallMGC 0.043.000

开源**小型媒体网关控制器(MGC)**,实现 **H.248(Megaco)** 协议服务器端,用于控制媒体网关(MG)完成呼叫接续。

- 语言:C/C++(Poco 库 1.3.6)
- 年代:2010 年(作者 Thomas Miesch,readme.txt 有完整版本历史)
- 许可:GPL v2

## 功能特性

| 功能 | 说明 |
|---|---|
| H.248(Megaco) MGC | 媒体网关控制器,控制 MG 完成呼叫(2944/UDP) |
| PSTN 呼叫流程 | callcontrol a / h / n / etsi 多种状态机 |
| ISDN | BRA/PRI 支持(需 SCTP,**本构建已禁用** -DNO_ISDN) |
| SIP / SDP | 解析器存在,未接入呼叫流程 |
| 配置与呼叫记录 | SQLite(`test.db` / `calls.db`) |

## 项目结构

```
smallmgc/
├── smallmgc.cpp           # 主程序(子系统装配)
├── smallmgc_*/            # 各子系统(H.248 解析、网关控制、呼叫控制、数据库等)
├── configuration.xml      # ★ 运行配置(MGC/网关/号码)
├── profile_default.xml    # profile 配置(网关包 Profile)
├── commands.txt           # 测试消息样例
├── readme.txt             # 作者原版说明/版本历史
├── docker-build/          # ★ 编译环境(Docker 容器内编译)
└── docker-deploy/         # ★ 部署环境(镜像 + 编排)
```

## 快速开始

### 1. 编译(在 Docker 容器内,免装依赖)

```bash
cd docker-build
podman build -t smallmgc-build:latest .     # 构建编译环境(Ubuntu 10.04 + gcc 4.4 + Poco 1.3.6p1)
podman-compose run --rm build               # 编译,产物: Release/smallmgc
```

> 也可手动:`cd Release && make clean && make all`

### 2. 构建部署镜像并启动

```bash
cd docker-deploy
./build.sh                  # 拷贝 Release/smallmgc 并构建部署镜像
podman-compose up -d        # 启动(host 网络,监听配置的 mgc.ip.h248:2944)
podman-compose logs -f      # 查看日志
```

### 3. 配置(runtime/configuration.xml,改完重启生效)

| 配置项 | 说明 |
|---|---|
| `mgc.ip.h248` | **服务器真实 IP**(MGC 绑定地址,也是 Reply 头 MID) |
| `mgc.ip.h248port` | H.248 端口(默认 2944) |
| `gateway[i].name` / `gateway[i].ip.h248` | 网关名称/地址(网关消息头 MID 匹配用) |
| `gateway[i].terminations.pstn.subscriber` | 注册号码:`<id>` = 网关上报的 Termination ID,`<number>` = 电话号码 |

模拟网关(MG)用 `!/1 [网关IP]:2944 T=...{C=-{SC=ROOT{SV{MT=FL,...}}}}` 注册,收到
`!/1 [MGC-IP]:2944 P=...{C=-{SC=root}}` 的 Reply 即注册成功。

## 为什么必须在 32 位环境编译

APG 生成的 H.248 解析数据表是 **32 位时代布局**(`ulong`=4 字节),64 位编译下
表 CRC 校验失败、解析器初始化返回空,收到任何报文即段错误崩溃。因此整个项目
按 **32 位(-m32)** 编译,与作者 2010 年环境一致。编译环境已封装在
`docker-build/`(含全部 32 位 Poco/sctp/sqlite 运行库)。

## 已知问题(详见 docker-deploy/README.md)

- 模拟网关**高频发包**(每秒数百个)时,gateway 处理任务偶发卡死 → 重启容器;建议发包频率 ≤ 2 秒/个。
- 消息头 `MEGACO/1 [IP]` 与 `!/1 [IP]` 均可解析,但 APG 解析器偶发解析失败(重发即恢复)。
- 网络要求:**服务器与模拟网关双向可达**,否则 Reply 无法到达(不在局域网需配路由/转发)。

## 版本历史

见 [readme.txt](readme.txt)(作者原版,2009-2011)。
