#!/usr/bin/env bash
# echo -e -n "$CONF" > /etc/v2ray/config.json

sed -ri "s/28807b19-64ac-431b-8f91-2e87b2aa63b2/$UUID/g" /etc/v2ray/config.json

supervisord -c /etc/supervisord.conf