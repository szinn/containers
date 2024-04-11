FROM public.ecr.aws/docker/library/rust:1.77.2@sha256:e0fd84e23bed2474fef23fdbb7b5845c8331e3fa1a20d255e25a0ee25e58ef01 as chef
WORKDIR /build

# compile openssl for static linking
RUN apt-get update && apt-get install -y g++ pkg-config musl-tools git
RUN git clone git://git.openssl.org/openssl.git
RUN cd openssl && git checkout OpenSSL_1_1_1-stable
RUN cd openssl && ./config -fPIC no-weak-ssl-ciphers no-async --prefix=/usr/local/ssl --openssldir=/usr/local/ssl
RUN cd openssl && make && make install
ENV OPENSSL_STATIC true
ENV OPENSSL_DIR /usr/local/ssl

# add compilation targets
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo install cargo-chef

LABEL org.opencontainers.image.source https://github.com/szinn/containers
