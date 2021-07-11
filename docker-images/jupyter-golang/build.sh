#!/usr/bin/env bash

set -e
set -o pipefail
export DOCKER_BUILDKIT=0



export GOLANG_VERSION=1.16.5
docker build -t butuzov/jupyter-golang:latest \
             --build-arg VERSION=${GOLANG_VERSION} \
             -f Dockerfile .

docker push butuzov/jupyter-golang:latest
