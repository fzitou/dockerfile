FROM v2ray/official

ARG TZ='Asia/Shanghai'

ENV V2_PATH='/usr/bin/v2ray/'
ENV PORT 8080/tcp

RUN wget -P $V2_PATH

RUN set -ex \
    && apk add -U --no-cache --virtual .tz \
        alpine-conf \
        tzdata \
    && /sbin/setup-timezone -z $TZ \
    && apk del .tz \
    && rm -rf /var/cache /root/.cache

EXPOSE $PORT
