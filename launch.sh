[ "$1" = "" ] && PORT=8388 || PORT=$1
docker run -d -p $PORT:8388 -P --name shadowsocks-c matttbe/shadowsocks-c -c /etc/shadowsocks-libev/config.json $2
