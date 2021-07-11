#!/usr/bin/env bash

set -e
set -o pipefail

export DOCKER_BUILDKIT=0


docker build -t butuzov/jupyter-typescript  .

docker push butuzov/jupyter-typescript
