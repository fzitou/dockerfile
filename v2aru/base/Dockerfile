FROM v2ray/official

ARG TZ='Asia/Shanghai'
ARG H2Y_URL='https://github.com/ToutyRater/V2Ray-SiteDAT/blob/master/geofiles/h2y.dat'
ARG V2_PATH='/usr/bin/v2ray/'

RUN wget -P $V2_PATH $H2Y_URL

RUN set -ex \
    && apk add -U --no-cache --virtual .tz \
        alpine-conf \
        tzdata \
    && /sbin/setup-timezone -z $TZ \
    && apk del .tz \
    && rm -rf /var/cache /root/.cache

