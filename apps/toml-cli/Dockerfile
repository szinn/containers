FROM rust:1.72@sha256:535b72c28764667805619fde2ec67adaf3457c425e9a0a3bbd0843f0067bdb96 as builder

RUN cargo install toml-cli

FROM debian:buster-slim
RUN apt-get update & apt-get install -y extra-runtime-dependencies & rm -rf /var/lib/apt/lists/*
RUN addgroup --gid 2134 toml && useradd -g 2134 -M -u 2134 -s /usr/sbin/nologin toml

COPY --from=builder /usr/local/cargo/bin/toml /usr/local/bin

USER toml

CMD ["/usr/local/bin/toml"]

LABEL org.opencontainers.image.source="https://github.com/gnprice/toml-cli"
