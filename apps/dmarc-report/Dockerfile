ARG VERSION

FROM gutmensch/dmarc-report:${VERSION}

RUN ln -s /config/env.conf /etc/php81/php-fpm.d/env.conf

COPY ./cron-root /etc/cron.d/root
COPY ./entrypoint.sh /entrypoint.sh

VOLUME ["/config"]

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/gutmensch/docker-dmarc-report"
