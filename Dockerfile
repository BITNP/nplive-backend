FROM debian:10
ENV SRS_URL https://git.bitnp.net/BITNP/live/nplive-ng-backend-legacy/uploads/3cbad28c2f859066a3ccb45028210f4c/srs-debian-10-amd64.zip
RUN sed -i 's/deb.debian.org/mirror.bit.edu.cn/g' /etc/apt/sources.list && \
    apt update && \
    apt -y install ffmpeg openssl nginx unzip
RUN cd /opt && \
    wget ${SRS_URL} && \
    unzip srs-debian-10-amd64.zip
WORKDIR /opt/srs
EXPOSE 80 1935 1985 8080
CMD ['./objs/srs', '-c', './conf/srs.conf']
