#基于哪个镜像制作,3.14会有问题
FROM alpine:3.13
#工作目录
WORKDIR /root
#复制脚本到root目录
COPY *.sh /root/
#执行安装脚本
RUN sh install.sh
#暴露端口
EXPOSE 80 443
#运行启动脚本和nginx
CMD ["/root/run.sh"]