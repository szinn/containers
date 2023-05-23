FROM rust:1.69@sha256:abebc0243d8d085f4499565dac18a5de8c15d621ff932d3444f405953b0ed445 as builder

RUN cargo install toml-cli

FROM debian:buster-slim
RUN apt-get update & apt-get install -y extra-runtime-dependencies & rm -rf /var/lib/apt/lists/*
RUN addgroup --gid 2134 toml && useradd -g 2134 -M -u 2134 -s /usr/sbin/nologin toml

COPY --from=builder /usr/local/cargo/bin/toml /usr/local/bin

USER toml

CMD ["/usr/local/bin/toml"]

LABEL org.opencontainers.image.source="https://github.com/gnprice/toml-cli"
