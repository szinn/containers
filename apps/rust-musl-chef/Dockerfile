FROM public.ecr.aws/docker/library/rust:1.85.0@sha256:e15c642b487dd013b2e425d001d32927391aca787ac582b98cca72234d466b60 as chef
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
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo install cargo-chef

LABEL org.opencontainers.image.source https://github.com/szinn/containers
