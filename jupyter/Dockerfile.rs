
FROM docker.io/rust:1.51.0-buster as rust

FROM butuzov/jupyter as base

ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH $RUSTUP_HOME/bin:$CARGO_HOME/bin:$PATH
COPY --from=rust  --chown=butuzov:users  /usr/local/rustup          /usr/local/rustup
COPY --from=rust  --chown=butuzov:users  /usr/local/cargo           /usr/local/cargo

# USER root
RUN cargo install evcxr_jupyter --no-default-features \
    && evcxr_jupyter --install
