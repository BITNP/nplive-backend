FROM debian:bullseye-slim
COPY srs-debian-11-amd64.zip /opt
RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org/debian-security|mirrors.tuna.tsinghua.edu.cn/debian-security|g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|mirrors.tuna.tsinghua.edu.cn/debian-security|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y ffmpeg openssl unzip && \
    rm -rf /var/lib/apt/lists/* && \
    cd /opt && \
    unzip srs-debian-11-amd64.zip && \
    rm srs-debian-11-amd64.zip
WORKDIR /opt/srs
CMD ["/opt/srs/objs/srs", "-c", "/opt/srs/conf/srs.conf"]
