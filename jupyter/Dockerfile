
FROM docker.io/rust:1.49.0-buster as rust

FROM docker.io/golang:1.15.8-buster as golang
RUN GO111MODULE=on go get github.com/gopherdata/gophernotes

FROM docker.io/julia:1.5.3-buster as julia

# -- Base ----------------------------------------------------------------------
FROM docker.io/python:3.9.1-buster as base


USER root
RUN apt-get update           \
    && apt-get install -y    \
        curl                 \
        cmake   \
        libzmq3-dev


# -- Jupyter -------------------------------------------------------------------

RUN groupadd --gid 1000 jupyter \
  && useradd --uid 1000 --gid jupyter --shell /bin/bash --create-home jupyter

USER jupyter

ENV JUPYTER_PATH /home/jupyter/.local
ENV PATH $JUPYTER_PATH/bin:$PATH
RUN python3 -m pip install --no-cache-dir \
        matplotlib  \
        mplcyberpunk\
        pandas \
        numpy \
        jupyter \
        jupyter_contrib_nbextensions

RUN jupyter notebook --generate-config -y
RUN jupyter contrib nbextension install --user

RUN mkdir /home/jupyter/.jupyter/custom/
COPY custom.css /home/jupyter/.jupyter/custom/
COPY notebook.json /home/jupyter/.jupyter/nbconfig/notebook.json



# Julia
USER jupyter
ENV JU_PATH /usr/local/julia
ENV PATH $JU_PATH/bin:$PATH
COPY --from=julia  /usr/local/julia          /usr/local/julia
RUN julia -e 'import Pkg; Pkg.add("IJulia");'


# Golang
ENV GO_PATH /usr/local/go
ENV PATH $GO_PATH/bin:$PATH
COPY --from=golang  /usr/local/go          /usr/local/go
COPY --from=golang  /go/bin/gophernotes    /usr/local/go/bin/gophernotes

RUN mkdir /home/jupyter/.local/share/jupyter/kernels/gophernotes/
COPY --from=golang --chown=jupyter:jupyter  /go/pkg/mod/github.com/gopherdata/gophernotes@v0.7.1/kernel/*    /home/jupyter/.local/share/jupyter/kernels/gophernotes/
RUN cd /home/jupyter/.local/share/jupyter/kernels/gophernotes/ && \
    unlink kernel.json && \
    sed "s|gophernotes|/usr/local/go/bin/gophernotes|" < kernel.json.in > kernel.json


# Rust
ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH $RUSTUP_HOME/bin:$CARGO_HOME/bin:$PATH
COPY --from=rust  --chown=jupyter:jupyter  /usr/local/rustup          /usr/local/rustup
COPY --from=rust  --chown=jupyter:jupyter  /usr/local/cargo           /usr/local/cargo

# USER root
RUN cargo install evcxr_jupyter --no-default-features \
    && evcxr_jupyter --install


WORKDIR /usr/share

ENTRYPOINT [ "jupyter", "notebook", "--config=/home/jupyter/.jupyter/nbconfig/",   "--ip=0.0.0.0", "--no-browser", "--port=8888", "--log-level", "DEBUG", "--allow-root" ]

# --notebook-dir=
