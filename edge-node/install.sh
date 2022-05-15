#!/bin/sh
#####   name:edge安装   #####
#####   author:xiaoz.me ####

#更新软件
apk update
#安装timezone
apk add -U tzdata
#查看时区列表
ls /usr/share/zoneinfo
#拷贝需要的时区文件到localtime
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#查看当前时间
date
#为了精简镜像，可以将tzdata删除了
apk del tzdata

apk add --no-cache wget curl unzip

#edge_node版本
VERSION='v0.4.7'

#安装edge_node
function install_edgenode(){
    mkdir -p /opt/cache
    chmod 777 /opt/cache
    cd /root
    wget https://dl.goedge.cn/edge-node/${VERSION}/edge-node-linux-amd64-plus-${VERSION}.zip
    unzip edge-node-linux-amd64-plus-${VERSION}.zip
    rm -rf edge-node-linux-amd64-plus-${VERSION}.zip
    mkdir -p /tmp/edge-node
    cp -f /root/edge-node/configs/api.template.yaml  /tmp/edge-node/
}
#清理工作
function make_clean(){
    apk del wget curl unzip
}

#调用函数执行
install_edgenode && make_clean
