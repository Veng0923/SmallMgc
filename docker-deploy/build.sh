#!/bin/bash
# 构建 SmallMGC 部署镜像
# 1. 拷贝已验证的 Release 二进制
# 2. 构建部署镜像 smallmgc-deploy:latest
set -e
cd "$(dirname "$0")"

echo "==> 拷贝 Release 二进制..."
cp ../Release/smallmgc ./smallmgc

echo "==> 构建部署镜像..."
podman build -t smallmgc-deploy:latest .

echo "==> 完成。启动: podman-compose up -d"
