ARG VERSION
ARG CHANNEL

FROM pihole/pihole:${VERSION:-latest}

RUN apt update && apt install -y unbound

COPY ./apps/pihole-unbound/unbound-pihole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY ./apps/pihole-unbound/99-edns.conf /etc/dnsmasq.d/99-edns.conf
RUN mkdir -p /etc/services.d/unbound
COPY ./apps/pihole-unbound/unbound-run /etc/services.d/unbound/run

ENTRYPOINT ./s6-init

LABEL org.opencontainers.image.source="https://github.com/pi-hole/pi-hole"
