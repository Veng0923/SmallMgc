# SmallMGC Web 配置管理镜像
# 独立容器运行(现代 Python,支持 Flask 3),通过 docker.sock / podman.sock 重启 smallmgc
FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/library/python:3.12-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

COPY app.py .
COPY templates/ templates/

EXPOSE 8080
CMD ["python", "app.py"]
