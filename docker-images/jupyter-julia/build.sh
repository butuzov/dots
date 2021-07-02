#!/usr/bin/env bash

set -e
set -o pipefail

export DOCKER_BUILDKIT=0


export JULIA_VERSION=1.5.3
docker build -t butuzov/jupyter-julia:latest \
             -t butuzov/jupyter-julia:${JULIA_VERSION} \
             --build-arg VERSION=${JULIA_VERSION} \
             -f Dockerfile
