# ShadownSock C (libev) with Ubuntu
#
# VERSION  0.0.1

FROM       ubuntu:14.04
MAINTAINER Matthieu Baerts "matttbe@gmail.com"

# Install ShadownSocks from apt repo
RUN apt-get update && apt-get install -y --force-yes wget
RUN wget -O- https://shadowsocks.org/debian/1D27208A.gpg | apt-key add -
RUN printf "deb http://shadowsocks.org/ubuntu trusty main" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y --force-yes shadowsocks-libev

# easier to configure and integrate passwords
ADD config.json /etc/shadowsocks-libev/config.json

# Note: we need to clearly expose the port number.
# Run it: thanks to entrypoint, we can add options when launching the container
ENTRYPOINT ["/usr/bin/ss-server"]
