FROM v2ray/official

ARG TZ='Asia/Shanghai'

RUN set -ex \
    && apk add -U --no-cache --virtual .tz \
        alpine-conf \
        tzdata \
    && /sbin/setup-timezone -z $TZ \
    && apk del .tz \
    && rm -rf /var/cache /root/.cache

ENV PORT 8080/tcp
EXPOSE $PORT
