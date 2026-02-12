#!/bin/sh

set -eu

CONFIG='/etc/tinyproxy/tinyproxy.conf'

if [ ! -f "$CONFIG"  ]; then
    cp /etc/tinyproxy/tinyproxy.default.conf "$CONFIG"
    sed -i "s|^Allow |#Allow |" "$CONFIG"
    [    "$PORT" != "8888" ]                              && sed -i "s|^Port 8888|Port $PORT|" "$CONFIG"
    [ -z "$DISABLE_VIA_HEADER" ]                          || sed -i "s|^#DisableViaHeader .*|DisableViaHeader Yes|" "$CONFIG"
    [ -z "$STAT_HOST" ]                                   || sed -i "s|^#StatHost .*|StatHost \"${STAT_HOST}\"|" "$CONFIG"
    [ -z "$MAX_CLIENTS" ]                                 || sed -i "s|^MaxClients .*|MaxClients $MAX_CLIENTS|" "$CONFIG"
    [ -z "$ALLOWED_NETWORKS" ]                            || for network in $ALLOWED_NETWORKS; do echo "Allow $network" >> "$CONFIG"; done
    [ -z "$LOG_LEVEL" ]                                   || sed -i "s|^LogLevel .*|LogLevel ${LOG_LEVEL}|" "$CONFIG"
    [ -z "$TIMEOUT" ]                                     || sed -i "s|^Timeout .*|Timeout ${TIMEOUT}|" "$CONFIG"
    [ -z "$AUTH_USER" ] || [ -z "$AUTH_PASSWORD" ]        || sed -i "s|^#BasicAuth .*|BasicAuth ${AUTH_USER} ${AUTH_PASSWORD}|" "$CONFIG"
    [ -z "$AUTH_USER" ] || [ ! -f "$AUTH_PASSWORD_FILE" ] || sed -Ei "s|^#?BasicAuth .*|BasicAuth ${AUTH_USER} $(cat "$AUTH_PASSWORD_FILE")|" "$CONFIG"
    sed -i 's|^LogFile |# LogFile |' "$CONFIG"
fi

exec /usr/bin/tinyproxy -d;
