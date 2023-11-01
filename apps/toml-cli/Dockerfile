FROM rust:1.73@sha256:4e0bd794f3390e8911537c92a2df09cbfacaf6752378bb1fdcbe021256a41c42 as builder

RUN cargo install toml-cli

FROM debian:buster-slim
RUN apt-get update & apt-get install -y extra-runtime-dependencies & rm -rf /var/lib/apt/lists/*
RUN addgroup --gid 2134 toml && useradd -g 2134 -M -u 2134 -s /usr/sbin/nologin toml

COPY --from=builder /usr/local/cargo/bin/toml /usr/local/bin

USER toml

CMD ["/usr/local/bin/toml"]

LABEL org.opencontainers.image.source="https://github.com/gnprice/toml-cli"
