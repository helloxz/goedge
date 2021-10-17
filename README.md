# goedge
GoEdge是一款管理分布式边缘节点的开源工具软件，目的是让用户轻松地、低成本地创建CDN/WAF等应用。

目前此项目仅支持运行`edge-node` ，请确保您已经安装`edge-admin`和`edge-api`，否则无法正常使用。

> 官方文档：[https://goedge.cn/docs/About.md](https://goedge.cn/docs/About.md)

## Docker运行edge-node

```bash
docker run -d --name="edge-node" \
  -e ENDPOINTS='http://IP:8001' \
  -e CLUSTERID='xxx' \
  -e SECRET='xxx' \
  -v /data/edge-node/cache:/opt/cache \
  -v /data/edge-node/configs:/root/edge-node/configs \
  --network=host \
  --restart=always \
  helloz/edge-node:0.3.2
```

首先在goedge管理界面 - 边缘节点 - 找到你所在集群 - 集群节点 - 安装升级 - 自动注册，记录：`endpoints/clusterId/secret`，如下图：

![](https://i.bmp.ovh/imgs/2021/10/57ec94f01752d7f9.png)

Docker参数对应关系为：

* `/data/edge-node/cache`：edge-node缓存路径，用于docker持久化存储
* `/data/edge-node/configs`：edge-node配置文件夹路径，用于docker持久化存储

* ENDPOINTS：对应`endpoints的URL地址
* CLUSTERID：对应clusterId
* SECRET：对应secret

运行成功后继续回到goedge管理界面 - 边缘节点即可看到刚刚自动注册的节点，然后进行管理设置即可。



## 注意

防火墙放行对应端口，一般为：

```bash
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --reload
```



## 其它说明

推荐将Docker容器网络类型设置为`--network=host`可降低网络开销，提高性能。而且`edge-node`的监听是可以自行设置的，不是固定某个端口，使用`--network=host`灵活性也更好。