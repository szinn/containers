FROM public.ecr.aws/docker/library/rust:1.86.0 as chef

ARG TARGETARCH

WORKDIR /build

# compile openssl for static linking
RUN apt-get update && apt-get install -y g++ pkg-config musl-tools git
RUN git clone https://github.com/openssl/openssl.git
RUN cd openssl && git checkout openssl-3.3
RUN cd openssl && ./config -fPIC no-weak-ssl-ciphers no-async --prefix=/usr/local/ssl --openssldir=/usr/local/ssl
RUN cd openssl && make && make install
ENV OPENSSL_STATIC true
ENV OPENSSL_DIR /usr/local/ssl

# add compilation targets
ENV PATH="/root/.cargo/bin:${PATH}"
RUN case "${TARGETARCH}" in \
  'linux/amd64') rustup target add x86_64-unknown-linux-musl ;; \
  'linux/arm64') rustup target add arm64-unknown-linux-musl ;; \
esac
RUN cargo install cargo-chef

LABEL org.opencontainers.image.source https://github.com/szinn/containers
