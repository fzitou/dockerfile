FROM v2ray/official

ARG TZ='Asia/Shanghai'
ARG H2Y_URL='https://github.com/ToutyRater/V2Ray-SiteDAT/blob/master/geofiles/h2y.dat'
ARG V2_PATH='/usr/bin/v2ray/'

ENV PORT 443/tcp
ENV UUID 65f77daa-519a-49e8-9552-0c0f559b387d

WORKDIR /var/www/
COPY html5up-zerofour.zip html5up-zerofour.zip
RUN apk add -U --no-cache \
        bash \
        nginx \
        supervisor \
    && apk add --no-cache --virtual .build-deps \
        unzip \
    && unzip html5up-zerofour.zip \
    && apk del .build-deps \
    && wget -P $V2_PATH $H2Y_URL \
    && rm -rf donwload /var/cache/apk/* /tmp/* /root/.cache

RUN set -x \
    && apk add --no-cache --virtual .tz alpine-conf tzdata \
    && /sbin/setup-timezone -z $TZ \
    && apk del .tz \
    && rm -rf /var/cache/apk/* /tmp/* /root/.cache


COPY server.json /etc/v2ray/config.json
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
EXPOSE $PORT
ENTRYPOINT  /entrypoint.sh
