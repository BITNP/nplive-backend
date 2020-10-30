FROM debian:10
COPY srs-debian-10-amd64.zip /opt
RUN sed -i 's/deb.debian.org/mirror.bit.edu.cn/g' /etc/apt/sources.list && \
    apt update && \
    apt -y install ffmpeg openssl nginx unzip
RUN cd /opt && \
    unzip srs-debian-10-amd64.zip
WORKDIR /opt/srs
EXPOSE 80 1935 1985 8080
CMD ['./objs/srs', '-c', './conf/srs.conf']
