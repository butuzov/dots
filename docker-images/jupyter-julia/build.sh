#!/usr/bin/env bash

set -e
set -o pipefail

export DOCKER_BUILDKIT=0


export JULIA_VERSION=1.6.2
docker build -t butuzov/jupyter-julia:latest \
             -t butuzov/jupyter-julia:${JULIA_VERSION} \
             --build-arg VERSION=${JULIA_VERSION} \
             -f Dockerfile .

docker push butuzov/jupyter-julia:latest
docker push butuzov/jupyter-julia:${JULIA_VERSION}
docker push butuzov/jupyter-julia:${JULIA_VERSION}
