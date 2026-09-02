# SmallMGC 0.043.000 编译镜像
# 基础镜像: Ubuntu 10.04 (lucid) —— 与 SmallMGC 同年代(2010)的工具链
# 必须 32 位(-m32)编译: APG 生成的 H.248 解析数据表是 32 位布局(ulong=4B),
# 64 位下 ulong=8B 导致表 CRC 校验失败、解析器初始化返回 NULL,
# 收到任何 H.248 报文即段错误崩溃。作者 2010 年即 32 位环境。
FROM docker.io/library/ubuntu:10.04

# Ubuntu 10.04 已 EOL,官方源下线,切换到 old-releases 源
RUN printf "deb http://old-releases.ubuntu.com/ubuntu/ lucid main universe multiverse restricted\ndeb http://old-releases.ubuntu.com/ubuntu/ lucid-updates main universe multiverse restricted\ndeb http://old-releases.ubuntu.com/ubuntu/ lucid-security main universe multiverse restricted\n" > /etc/apt/sources.list \
    && mkdir -p /var/lib/apt/lists/partial \
    && apt-get update \
    && apt-get install -y build-essential libpoco-dev libsctp-dev curl \
       gcc-4.4-multilib g++-4.4-multilib libc6-dev-i386 gdb \
    && rm -rf /var/lib/apt/lists/*

# 32 位(i386)运行库: Ubuntu 10.04 不支持 multiarch,手动下载 i386 deb 解压,
# 并软链到 /usr/lib32(32 位程序的默认库搜索路径,运行时免 LD_LIBRARY_PATH)
RUN mkdir -p /opt/i386-debs && cd /opt/i386-debs && \
    for f in \
      universe/p/poco/libpoco-dev_1.3.6p1-1_i386.deb \
      universe/p/poco/libpocofoundation9_1.3.6p1-1_i386.deb \
      universe/p/poco/libpocoxml9_1.3.6p1-1_i386.deb \
      universe/p/poco/libpocoutil9_1.3.6p1-1_i386.deb \
      universe/p/poco/libpoconet9_1.3.6p1-1_i386.deb \
      universe/p/poco/libpocodata9_1.3.6p1-1_i386.deb \
      universe/p/poco/libpocosqlite9_1.3.6p1-1_i386.deb \
      universe/p/poco/libpocozip9_1.3.6p1-1_i386.deb \
      universe/p/poco/libpococrypto9_1.3.6p1-1_i386.deb \
      universe/p/poco/libpocomysql9_1.3.6p1-1_i386.deb \
      universe/p/poco/libpocoodbc9_1.3.6p1-1_i386.deb \
      universe/p/poco/libpoconetssl9_1.3.6p1-1_i386.deb \
      universe/l/lksctp-tools/libsctp-dev_1.0.9.dfsg-1_i386.deb \
      universe/l/lksctp-tools/libsctp1_1.0.9.dfsg-1_i386.deb \
      main/s/sqlite3/libsqlite3-0_3.7.9-2ubuntu1_i386.deb \
      main/e/expat/libexpat1_2.0.1-7ubuntu3_i386.deb \
      main/p/pcre3/libpcre3_7.8-3_i386.deb \
      main/z/zlib/zlib1g_1.2.3.4.dfsg-3ubuntu4_i386.deb; do \
      curl -sO "http://old-releases.ubuntu.com/ubuntu/pool/$f" || exit 1; \
    done && \
    for d in *.deb; do dpkg -x "$d" /; done && \
    cd / && rm -rf /opt/i386-debs && \
    # 32 位运行库软链: 显式确定性修正(避免 64 位同名库冲突),
    # 指向 /usr/lib 与 /lib(32 位 loader 默认搜索路径)及 /usr/lib32
    ln -sf /usr/lib/libsctp.so.1.0.9 /usr/lib/libsctp.so.1 && \
    ln -sf /usr/lib/libsctp.so.1.0.9 /usr/lib/libsctp.so && \
    ln -sf /usr/lib/libsctp.so.1.0.9 /usr/lib32/libsctp.so.1 && \
    ln -sf /usr/lib/i386-linux-gnu/libsqlite3.so.0.8.6 /usr/lib/libsqlite3.so.0 && \
    ln -sf /usr/lib/i386-linux-gnu/libsqlite3.so.0.8.6 /usr/lib32/libsqlite3.so.0 && \
    ln -sf /lib/i386-linux-gnu/libexpat.so.1.5.2 /usr/lib/libexpat.so.1 && \
    ln -sf /lib/i386-linux-gnu/libexpat.so.1.5.2 /usr/lib32/libexpat.so.1 && \
    ln -sf /lib/i386-linux-gnu/libz.so.1.2.3.4 /usr/lib/libz.so.1 && \
    ln -sf /lib/i386-linux-gnu/libz.so.1.2.3.4 /usr/lib32/libz.so.1 && \
    ln -sf /lib/libpcre.so.3.12.1 /usr/lib/libpcre.so.3 && \
    ln -sf /lib/libpcre.so.3.12.1 /usr/lib32/libpcre.so.3 && \
    for p in PocoUtil PocoXML PocoFoundation PocoNet PocoData PocoSQLite PocoZip; do \
      ln -sf "/usr/lib/lib$p.so.9" "/usr/lib32/lib$p.so.9"; \
    done && \
    # expat/zlib 补 .so 软链供 -l 链接
    ln -sf /lib/i386-linux-gnu/libexpat.so.1 /usr/lib/libexpat.so && \
    ln -sf /lib/i386-linux-gnu/libz.so.1 /usr/lib/libz.so

# 默认工作目录(实际编译目录由 docker-compose 指定)
WORKDIR /build
