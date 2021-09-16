#!/usr/bin/env bash

set -e
set -o pipefail

export DOCKER_BUILDKIT=0

export RUST_VERSION=1.55.0
docker build -t butuzov/jupyter-rust:latest \
             -t butuzov/jupyter-rust:${RUST_VERSION} \
             --build-arg VERSION=${RUST_VERSION} \
             -f Dockerfile .

docker push butuzov/jupyter-rust:latest
docker push butuzov/jupyter-rust:${RUST_VERSION}
docker rmi  butuzov/jupyter-rust:${RUST_VERSION}

