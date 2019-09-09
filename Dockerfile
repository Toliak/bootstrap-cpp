FROM alpine:3.10.2

LABEL maintainer="toliakpurple@gmail.com"

RUN apk update && \
    apk add linux-headers \
            musl-dev \
            build-base \
            gcc \
            g++ \
            make \
            cmake \
            gcovr \
            py-setuptools \
            npm \
            && \
    npm install -g jscpd && \
    rm -rf ${HOME}/.cache && \
    rm -rf /var/cache/apk/*

VOLUME /opt/builder
WORKDIR /opt/builder