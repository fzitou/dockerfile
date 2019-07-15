FROM v2ray/official

ENV PORT 443/tcp
ENV UUID 65f77daa-519a-49e8-9552-0c0f559b387d
ENV DNS 8.8.8.8

WORKDIR /var/www/
COPY html5up-zerofour.zip fe.zip
RUN apk add -U --no-cache \
        bash \
        nginx \
        supervisor \
    && apk add --no-cache --virtual .build-deps \
        unzip \
    && unzip fe.zip \
    && rm -rf fe.zip \
            /var/cache/apk/* \
            /tmp/* \
            /root/.cache

COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY server.json /etc/v2ray/config.json
COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
EXPOSE $PORT
ENTRYPOINT  /entrypoint.sh
