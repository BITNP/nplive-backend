FROM debian:buster-slim
COPY srs-debian-10-amd64.zip /opt
RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org/debian-security|mirrors.tuna.tsinghua.edu.cn/debian-security|g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|mirrors.tuna.tsinghua.edu.cn/debian-security|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y nginx supervisor ffmpeg openssl unzip && \
    echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm -rf /var/lib/apt/lists/* && \
    cd /opt && \
    unzip srs-debian-10-amd64.zip && \
    rm srs-debian-10-amd64.zip
COPY deploy/supervisor-app.conf /etc/supervisor/conf.d/
WORKDIR /opt/srs
EXPOSE 80 1935 1985 8080
CMD ["supervisord", "-n"]
