#!/usr/bin/with-contenv bashio

VERSION=$(cat VERSION)
BESZEL_HUB_VERSION=$(cat BESZEL_HUB_VERSION)
CSP="$(bashio::config 'csp')"
DISABLE_PASSWORD_AUTH="$(bashio::config 'disable_password_auth')"
USER_CREATION="$(bashio::config 'user_creation')"

# add date to default bashio log timestamp
declare __BASHIO_LOG_TIMESTAMP="%Y-%m-%d %T"

bashio::log.info "Beszel Hub Home Assistant Add-On $VERSION"
bashio::log.info "Beszel Hub $BESZEL_HUB_VERSION"

env CSP="$CSP" \
    DISABLE_PASSWORD_AUTH="$DISABLE_PASSWORD_AUTH" \
    USER_CREATION="$USER_CREATION" \
    ./beszel-hub
