# SmallMGC 0.043.000 部署镜像
# 基于编译镜像(含全部 32 位运行库: Poco 1.3.6p1 / sctp / sqlite / expat / pcre / zlib)
# 已验证可用的运行环境,部署零风险
FROM smallmgc-build:latest

# 复制已验证的 32 位可执行文件
COPY smallmgc /opt/smallmgc/smallmgc

# 运行目录: 配置文件/数据库/日志通过卷映射挂载到这里
RUN mkdir -p /opt/smallmgc/runtime

WORKDIR /opt/smallmgc/runtime
