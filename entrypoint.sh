#!/bin/sh

set -e
if [[ "${DEBUG}" ]]; then
    set -x
fi

# match user uids / gids
source setuidgid.inc

set -- "$@" -datadir="$BITCOIN_DATA"

if [[ "$BITCOIN_MAX_MEM_POOL" ]]; then
    set -- "$@" -maxmempool="$BITCOIN_MAX_MEM_POOL"
fi

if [[ "$BITCOIN_MAX_DBCACHE" ]]; then
    set -- "$@" -dbcache="$BITCOIN_MAX_DBCACHE"
fi

exec gosu "${DOCKER_USER}" "$@"