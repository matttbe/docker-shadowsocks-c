# ShadownSock C (libev) with Ubuntu
#
# VERSION  0.0.1

FROM       ubuntu:14.04
MAINTAINER Matthieu Baerts "matttbe@gmail.com"

# Install ShadownSocks by compiling it from source
RUN apt-get update && apt-get install -y --force-yes git build-essential autoconf libtool libssl-dev
RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git
WORKDIR shadowsocks-libev
RUN ./configure --prefix=/usr && make && make install
COPY debian/config.json /etc/shadowsocks-libev/config.json

# Note: we need to clearly expose the port number.
# Run it: thanks to entrypoint, we can add options when launching the container
ENTRYPOINT ["/usr/bin/ss-server"]
