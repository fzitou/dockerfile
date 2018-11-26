FROM v2ray/official

ARG TZ='Asia/Shanghai'

ENV TZ $TZ
ENV PORT 443/tcp
#ENV HTML5_UP_DOWNLOAD_URL https://html5up.net/zerofour/download

WORKDIR /var/www/
COPY html5up-zerofour.zip html5up-zerofour.zip
RUN apk add -U --no-cache \
        bash \
        caddy \
        supervisor \
    && apk add --no-cache --virtual .build-deps \
        unzip \
#    && wget ${HTML5_UP_DOWNLOAD_URL}  \
    && unzip html5up-zerofour.zip \
    && apk del .build-deps \
    && rm -rf donwload /var/cache/apk/* /tmp/* /root/.cache

RUN set -x \
    && apk add --no-cache --virtual .tz alpine-conf tzdata \
    && /sbin/setup-timezone -z $TZ \
    && apk del .tz \
    && rm -rf /var/cache/apk/* /tmp/* /root/.cache


COPY server.json /etc/v2ray/config.json
COPY Caddyfile /etc/caddy/caddy.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY supervisord.conf /etc/supervisord.conf
EXPOSE $PORT
ENTRYPOINT  /entrypoint.sh