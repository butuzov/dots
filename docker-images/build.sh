#!/usr/bin/env bash

set -e
set -o pipefail

export DOCKER_BUILDKIT=0

docker build -t butuzov/jupyter -f jupyter-base/Dockerfile jupyter-base
docker push butuzov/jupyter

pushd jupyter-typescript
   ./build.sh
popd

pushd jupyter-golang
   ./build.sh
popd

pushd jupyter-julia
   ./build.sh
popd

pushd jupyter-rust
   ./build.sh
popd


docker build -t butuzov/toolbox -f toolbox/Dockerfile toolbox

pushd act-go
  ./build.sh
popd

pushd act-python
  ./build.sh
popd
