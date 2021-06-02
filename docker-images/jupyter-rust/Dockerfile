ARG VERSION=1.52.1
FROM rust:${VERSION}-buster as rust

FROM butuzov/jupyter as base

ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH $RUSTUP_HOME/bin:$CARGO_HOME/bin:$PATH

COPY --from=rust  --chown=butuzov:users  /usr/local/rustup          /usr/local/rustup
COPY --from=rust  --chown=butuzov:users  /usr/local/cargo           /usr/local/cargo

USER root
RUN apt update && apt install libtool pkg-config build-essential autoconf automake -y
RUN apt install libzmq3-dev -y
RUN cargo install evcxr_jupyter --no-default-features \
    && evcxr_jupyter --install
