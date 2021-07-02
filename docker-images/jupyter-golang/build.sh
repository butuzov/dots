#!/usr/bin/env bash

set -e
set -o pipefail
export DOCKER_BUILDKIT=0



export GOLANG_VERSION=1.16.5
docker build -t butuzov/jupyter-golang:latest \
             -t butuzov/jupyter-golang:${GOLANG_VERSION} \
             --build-arg VERSION=${GOLANG_VERSION} \
             -f Dockerfile .
