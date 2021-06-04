#!/usr/bin/env bash

export DOCKER_BUILDKIT=0

docker build -t butuzov/jupyter -f jupyter-base/Dockerfile jupyter-base

export JULIA_VERSION=1.5.3
docker build -t butuzov/jupyter-julia:latest \
             -t butuzov/jupyter-julia:${JULIA_VERSION} \
             --build-arg VERSION=${JULIA_VERSION} \
             -f jupyter-julia/Dockerfile jupyter-julia

export GOLANG_VERSION=1.16.4
docker build -t butuzov/jupyter-golang:latest \
             -t butuzov/jupyter-golang:${GOLANG_VERSION} \
             --build-arg VERSION=${GOLANG_VERSION} \
             -f jupyter-golang/Dockerfile jupyter-golang


# always latest
docker build -t butuzov/jupyter-typescript -f jupyter-typescript/Dockerfile jupyter-typescript



export RUST_VERSION=1.52.1
docker build -t butuzov/jupyter-rust:latest \
             -t butuzov/jupyter-rust:${RUST_VERSION} \
             --build-arg VERSION=${RUST_VERSION} \
             -f jupyter-rust/Dockerfile jupyter-rust

docker build -t butuzov/toolbox -f toolbox/Dockerfile toolbox

pushd act-go
  ./build.sh
popd

pushd act-python
  ./build.sh
popd
