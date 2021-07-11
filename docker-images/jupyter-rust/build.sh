#!/usr/bin/env bash

set -e
set -o pipefail

export DOCKER_BUILDKIT=0

export RUST_VERSION=1.52.1
docker build -t butuzov/jupyter-rust:latest \
            #  -t butuzov/jupyter-rust:${RUST_VERSION} \
             --build-arg VERSION=${RUST_VERSION} \
             -f Dockerfile .

docker push butuzov/jupyter-rust:latest
