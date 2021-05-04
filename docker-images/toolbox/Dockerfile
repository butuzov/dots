FROM alpine:latest

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
    && apk update \
    && apk --update add --no-cache -t .deps ca-certificates \
    && apk add \
        bash \
        bash-completion \
        curl \
        strace \
        git \
        jq \
        yq \
        openssh \
        openssl \
        procps \
        nmap \
        vim \
        tmux \
    && rm -rf  /var/cache/apk/*  \
    && apk del .deps  \
    && rm -rf  /usr/share/vim/vim81/autoload/* \
    && rm -rf  /usr/share/vim/vim81/compiler/*
