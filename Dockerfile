FROM alpine:latest
ENV TZ Asia/Shanghai
ENV LC_ALL=zh_CN.UTF-8

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk add tzdata && cp /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone && \
    apk add ttf-dejavu fontconfig && mkfontscale && mkfontdir && fc-cache && \
    apk add zbar && \
    apk add chromium=107.0.5304.121-r0 && \
    apk add chromium-chromedriver=107.0.5304.121-r0 && \
    sed -i "s/\x24\x63\x64\x63\x5F/\x24\x61\x62\x63\x5F/g" /usr/lib/chromium/chromedriver && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /data/XueQG/App && \
    mkdir -p /data/XueQG/Config && \
    cd /data/XueQG

COPY upload /data/XueQG/

WORKDIR /data/XueQG
ENTRYPOINT ["./XueQG"]
