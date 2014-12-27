# Docker ShadowSocks C (libev)

This repository contains a Dockerfile to build a [ShadowSocks](https://github.com/madeye/shadowsocks-libev/#usage) (made in pure C with libev) server.

By default, it will run on port 8388 and serve everybody with the password `barfoo!` and packets are encrypted with `aes-256-cfb` method. But you can change these settings by modifying the `config.json` file or by adding options when starting the docker.

## How to pull already built images?

If you don't want to build it, simply pull the image:

    docker pull matttbe/docker-shadowsocks-c

## How to build?

By building it by yourself, you can change some options in the `config.json` file (e.g. if you don't want that the password will appear when launching `ps` command.

    git clone https://github.com/matttbe/docker-shadowsocks-c.git
    cd docker-shadowsocks-c
    vim config.json ## if needed
    docker build -t matttbe/docker-shadowsocks-c .


## How to launch it?
You can simply launch it as any other docker image but don't forget to expose and redirect ports, e.g.: you can use the port `1234`:

    docker run -d -p 1234:8388 -P --name shadowsocks-c matttbe/shadowsocks-c -c /etc/shadowsocks-libev/config.json

You can also add [options](https://github.com/madeye/shadowsocks-libev/#usage), e.g.

    docker run -d -p 8388:8388 -P --name shadowsocks-c matttbe/shadowsocks-c -s 0.0.0.0 -p 8388 -l 1080 -k barfoo -m aes-128-cfb

