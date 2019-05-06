FROM v2ray/official

ARG TZ='Asia/Shanghai'
ARG V2_PATH='/usr/bin/v2ray/'
ARG UUID='65f77daa-519a-49e8-9552-0c0f559b387d'

ENV PORT 443/tcp

WORKDIR /var/www/
ADD html5up-eventually.zip .
RUN apk add -U --no-cache \
        caddy \
        supervisor \
    && apk del .build-deps \
    && wget -P $V2_PATH \
    && rm -rf donwload /var/cache/apk/* /tmp/* /root/.cache

RUN set -x \
    && apk add --no-cache --virtual .tz alpine-conf tzdata \
    && /sbin/setup-timezone -z $TZ \
    && apk del .tz \
    && rm -rf /var/cache/apk/* /tmp/* /root/.cache


COPY server.json /etc/v2ray/config.json
COPY Caddyfile /etc/caddy/caddy.conf
COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
EXPOSE $PORT
ENTRYPOINT  /entrypoint.sh
