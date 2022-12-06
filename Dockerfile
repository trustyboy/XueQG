FROM debian:stable-slim
RUN set -x; buildDeps='wget locales' \
    && apt-get update \
    && apt-get install -y $buildDeps \
    && mkdir -p /data/XueQG/App \
    && mkdir -p /data/XueQG/Config \
    && cd /data/XueQG \
    && echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "Asia/Shanghai" > /etc/timezone && cp -a /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && locale-gen zh_CN.UTF-8 UTF-8 \
    && apt-get install -y chromium \
    && apt-get install -y libzbar-dev \
    && apt-get clean
COPY upload /data/XueQG/
COPY App/chromedriver  /usr/lib/chromium/chromedriver
RUN chmod +x /usr/lib/chromium/chromedriver
ENV LC_ALL=zh_CN.UTF-8
WORKDIR /data/XueQG
ENTRYPOINT ["./XueQG"]
