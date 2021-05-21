FROM golang:1.16.4-buster

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends \
        git

WORKDIR /usr/local/go2
RUN git clone http://github.com/golang/go . \
    && git checkout dev.go2go

RUN cd src && ./make.bash

ENV PATH="/usr/local/go2/bin:/usr/local/go2/pkg/tool/linux_amd64:$PATH"

WORKDIR /code



#  docker run -rm --it -v "$():" butuzov/go2 bash
