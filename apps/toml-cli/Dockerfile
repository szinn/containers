FROM rust:1.75@sha256:87f3b2f93b82995443a1a558c234212dafe79cfdc3af956539610560369ddcd0 as builder

RUN cargo install toml-cli

FROM debian:buster-slim
RUN apt-get update & apt-get install -y extra-runtime-dependencies & rm -rf /var/lib/apt/lists/*
RUN addgroup --gid 2134 toml && useradd -g 2134 -M -u 2134 -s /usr/sbin/nologin toml

COPY --from=builder /usr/local/cargo/bin/toml /usr/local/bin

USER toml

CMD ["/usr/local/bin/toml"]

LABEL org.opencontainers.image.source="https://github.com/gnprice/toml-cli"
