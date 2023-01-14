#!/usr/bin/env bash

#shellcheck disable=SC1091
test -f "/scripts/umask.sh" && source "/scripts/umask.sh"

# if test -z "${LAZYLIBRARIAN__LOG_DIR}"; then
#     LAZYLIBRARIAN__LOG_DIR="/config/log"
# fi
# if test -z "${LAZYLIBRARIAN__BOOK_DIR}"; then
#     LAZYLIBRARIAN__BOOK_DIR="/books"
# fi
# if test -z "${LAZYLIBRARIAN__DOWNLOAD_DIR}"; then
#     LAZYLIBRARIAN__DOWNLOAD_DIR="/downloads"
# fi

# Discover existing configuration settings for backwards compatibility
if ! [[ -f /config/config.ini ]]; then
    envsubst < /defaults/config.ini.tmpl > /config/config.ini
fi

#shellcheck disable=SC2086
exec \
    python3 /app/lazylibrarian/LazyLibrarian.py \
        --config /config/config.ini \
        --datadir /config \
        --debug
