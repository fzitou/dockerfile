FROM v2ray/official

ENV PORT 443/tcp
ENV UUID 65f77daa-519a-49e8-9552-0c0f559b387d

WORKDIR /var/www/
COPY html5up-eventually.zip fe.zip
RUN apk add -U --no-cache \
        bash \
        caddy \
        supervisor \
    && apk add --no-cache --virtual .build-deps \
        unzip \
    && unzip fe.zip \
    && rm -rf fe.zip \
            /var/cache/apk/* \
            /tmp/* \
            /root/.cache

COPY Caddyfile /etc/caddy/caddy.conf
COPY server.json /etc/v2ray/config.json
COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
EXPOSE $PORT
ENTRYPOINT  /entrypoint.sh
