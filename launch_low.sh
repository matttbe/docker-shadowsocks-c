[ "$1" = "" ] && PORT=8388 || PORT=$1
docker run -d -p $PORT:8388 -P --name shadowsocks-c matttbe/shadowsocks-c -m table
