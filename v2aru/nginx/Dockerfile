FROM fzitou/v2ray

ARG UUID='65f77daa-519a-49e8-9552-0c0f559b387d'

ENV PORT 443/tcp

WORKDIR /var/www/
ADD html5up-zerofour.zip .
RUN apk add -U --no-cache \
        nginx \
        supervisor \
    && apk del .build-deps \
    && wget -P $V2_PATH \
    && rm -rf /var/cache/apk/* \
            /tmp/* \
            /root/.cache

COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY server.json /etc/v2ray/config.json
COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
EXPOSE $PORT
ENTRYPOINT  /entrypoint.sh
