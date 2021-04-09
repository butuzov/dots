FROM docker.io/golang:1.16-buster as golang

RUN GO111MODULE=on go get github.com/gopherdata/gophernotes

FROM butuzov/jupyter as base

ENV GO_PATH /usr/local/go
ENV PATH $GO_PATH/bin:$PATH
COPY --from=golang  /usr/local/go          /usr/local/go
COPY --from=golang  /go/bin/gophernotes    /usr/local/go/bin/gophernotes

RUN mkdir -p /home/butuzov/.local/share/jupyter/kernels/gophernotes/

COPY --from=golang --chown=butuzov:users  /go/pkg/mod/github.com/gopherdata/gophernotes@v0.7.2/kernel/*    /home/butuzov/.local/share/jupyter/kernels/gophernotes/

RUN cd /home/butuzov/.local/share/jupyter/kernels/gophernotes/ && \
    unlink kernel.json && \
    sed "s|gophernotes|/usr/local/go/bin/gophernotes|" < kernel.json.in > kernel.json


