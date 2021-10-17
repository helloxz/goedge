#!/bin/sh
#####   name:edge-node运行   #####
#####   author:xiaoz.me #####

EDGE_PATH='/root/edge-node'

#运行edge_node
function run(){
    ${EDGE_PATH}/bin/edge-node
    # sleep 10
    # tail -f ${EDGE_PATH}/logs/run.log
}
#如果文件存在
if [ -e ${EDGE_PATH}/configs/cluster.yaml ]
then
    run
else
    touch ${EDGE_PATH}/configs/cluster.yaml
cat >> ${EDGE_PATH}/configs/cluster.yaml << EOF
rpc:
    endpoints: [ "${ENDPOINTS}" ]
clusterId: "${CLUSTERID}"
secret: "${SECRET}"
EOF
    run
fi