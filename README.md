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

## configuration.xml 配置详解

程序**启动时硬编码读取工作目录下的 `./configuration.xml`**(命令行 `-D` 覆盖无效),改完**重启容器**生效。结构如下:

```
<config>
├── <app>          应用数据(数据库)
├── <test>         测试模式(未启用)
├── <mgc>          MGC 自身配置
└── <gateway> ×N   网关配置(每个模拟网关一段)
```

### `<app>` — 应用数据

```xml
<app>
    <configdatabase>
        <persistent>1</persistent>   <!-- 配置持久化 -->
        <filename>test</filename>     <!-- 配置缓存 sqlite 文件名(test.db) -->
        <external>0</external>        <!-- 0=从本 XML 读配置, 1=从 sqlite 读 -->
        <xmlfile>1</xmlfile>          <!-- 1=XML 为配置源 -->
    </configdatabase>
    <calldatabase>
        <persistent>1</persistent>    <!-- 呼叫记录持久化 -->
        <filename>calls</filename>    <!-- 呼叫数据库文件名(calls.db) -->
    </calldatabase>
</app>
```

- `external=0 + xmlfile=1` 时,每次启动从 XML 重建 `test.db`,**改 XML 重启即生效**;
- `external=1` 时才需要直接改 sqlite 数据库。

### `<mgc>` — MGC 自身

| 字段 | 说明 |
|---|---|
| `name` | MGC 名称 |
| `ip.h248` | ★ **MGC 监听地址 / Reply 头 MID**。host 网络下填**服务器真实 IP**(容器内 0.0.0.0 会导致 Reply MID 无法识别,模拟网关收不到应答) |
| `ip.h248port` | H.248 端口(默认 2944) |
| `ip.sigtran` / `sigtranport` | SCTP 信令(ISDN 用,本构建已禁用,保持 0.0.0.0/0) |
| `retransmission` | 消息重传次数 |
| `modifybundles` / `bundlestimeout` | 启动 Modify 包合并相关 |
| `digitmap` | 号码匹配模板(`xxxxx`) |
| `callcontrol` | 默认呼叫流程:`a`(基本)/ `h` / `n`(ETSI)/ `e` / `x` |
| `esa.mode` | 0=关闭 ESA 主备切换;1=开启(配合 `primarymgc` 备用 MGC 地址) |
| `busytoneduration` 等 | 忙音/拥塞音/催挂音时长(毫秒) |

### `<gateway>` — 网关(每台模拟网关一段,复制整段修改即可)

| 字段 | 说明 |
|---|---|
| `name` | 网关名(可作为 MID 匹配项) |
| `ip.h248` | ★ **网关地址**。网关消息头里的 MID 必须等于它(或 `name`),否则匹配不上、不回 Reply |
| `ip.h248port` | 网关 H.248 端口(默认 2944) |
| `profile` | 引用的 profile 文件(`profile_default.xml`,必须存在于工作目录,缺失启动崩溃) |
| `callcontrol` | 该网关的呼叫流程(`a`/`n` 等) |
| `itpackage.mode` / `timeout` | IT 包(内部音)配置 |

### `<gateway>.terminations` — 注册号码

```xml
<terminations>
    <pstn>                       <!-- PSTN 号码 -->
        <subscriber>
            <id>A0</id>          <!-- H.248 Termination ID(与网关上报一致) -->
            <number>12340</number><!-- 电话号码 -->
        </subscriber>
        <!-- 加号码:复制 subscriber 节点,改 id/number -->
    </pstn>
    <isdn> ... </isdn>           <!-- ISDN BRA(本构建 NO_ISDN 不生效,仅示例) -->
    <pri> ... </pri>             <!-- ISDN PRI(同上) -->
</terminations>
```

| 子段 | 字段 | 说明 |
|---|---|---|
| `pstn.subscriber` | `id` / `number` | PSTN 终结点:Termination ID + 电话号码 |
| `isdn.subscriber` | `iua` / `iuaint` / `id` / `id1` / `number` | ISDN BRA(双通道 id/id1) |
| `pri.subscriber` | `iua` / `iuaint` / `id`~`id30` / `number` | ISDN PRI(30 通道) |

**匹配规则**:网关上报的 Termination ID 与配置 `<id>` 比对(大小写不敏感,统一转小写);
MID 与 `ip.h248` 或 `name` 比对。号码挂哪个网关段,网关就必须以对应 MID 上报。

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
