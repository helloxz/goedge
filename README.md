# goedge
是用Docker方式部署goedge，目前仅支持edge-node



## Docker运行edge-node

```bash
docker run -d --name="edge-node" \
	-e ENDPOINTS='http://IP:8001' \
	-e CLUSTERID='xxx' \
	-e SECRET='xxx' \
	--network=host \
	--restart=always \
	helloz/edge-node:0.3.2
```

首先在goedge管理界面 - 边缘节点 - 找到你所在集群 - 集群节点 - 安装升级 - 自动注册，记录：`endpoints/clusterId/secret`，如下图：

![](https://i.bmp.ovh/imgs/2021/10/57ec94f01752d7f9.png)

Docker参数对应关系为：

* ENDPOINTS：对应`endpoints的URL地址
* CLUSTERID：对应clusterId
* SECRET：对应SECRET

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