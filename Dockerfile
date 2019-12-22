FROM alpine:3.10.2

LABEL maintainer="toliakpurple@gmail.com"

COPY CMakeLists.txt /tmp/hunter-preload/CMakeLists.txt

RUN apk update && \
    apk add linux-headers \
            musl-dev \
            build-base \
            gcc \
            git \
            g++ \
            make \
            cmake \
            gcovr \
            py-setuptools \
            npm \
            valgrind \
            perl \
            bash \
            clang \
            && \
    npm install -g jscpd && \
    mkdir -p /tmp/hunter-preload && \
    cd /tmp/hunter-preload && \
    git clone https://github.com/hunter-packages/gate.git gate && \
    cmake -H. -B.build && \
    cd / && \
    rm -rf /tmp/hunter-preload && \
    rm -rf ${HOME}/.cache && \
    rm -rf /var/cache/apk/*

VOLUME /opt/builder
WORKDIR /opt/builder
