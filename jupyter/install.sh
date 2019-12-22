#!/usr/bin/env bash

# Installs Jupyter and Go Kernel into ~/venv/jupyter directory

export JUPYTER_CONFIG_DIR=/Users/butuzov/venvs/jupyter/share/jupyter/

mkdir -p ~/venvs/jupyter
python3.7 -m venv  ~/venvs/jupyter
. ~/venvs/jupyter/bin/activate
pip install --upgrade pip
pip install jupyter jupyter_contrib_nbextensions


jupyter contrib nbextension install --sys-prefix
cp -R custom/ ~/venvs/jupyter/share/jupyter/
cp -R nbconfig/ ~/venvs/jupyter/share/jupyter/


# GO kernel
if [[ ! -d ~/venvs/jupyter/share/jupyter/kernels/gophernotes ]]; then
    brew install zeromq
    brew install pkg-config
    go get -u github.com/gopherdata/gophernotes
    mkdir -p ~/venvs/jupyter/share/jupyter/kernels/gophernotes
    cp $GOPATH/src/github.com/gopherdata/gophernotes/kernel/* ~/venvs/jupyter/share/jupyter/kernels/gophernotes
fi
deactivate
