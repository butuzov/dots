#!/usr/bin/env bash

export DOCKER_BUILDKIT=0

# docker build -t butuzov/jupyter -f jupyter-base/Dockerfile jupyter-base

# docker build -t butuzov/jupyter-julia  -f jupyter-julia/Dockerfile jupyter-julia
# docker build -t butuzov/jupyter-golang -f jupyter-go/Dockerfile jupyter-golang
# docker build -t butuzov/jupyter-typescript -f jupyter-typescript/Dockerfile jupyter-typescript
docker build -t butuzov/jupyter-rust -f jupyter-rust/Dockerfile jupyter-rust

# docker build -t butuzov/toolbox -f toolbox/Dockerfile toolbox
