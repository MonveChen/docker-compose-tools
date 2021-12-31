
###问题一
遇到：Yikes! KeeperErrorCode = Unimplemented for /kafka-manager/mutex

解决方法：
➜ docker exec -it zookeeper bash
root@98747a9eac65:/zookeeper-3.4.14# ./bin/zkCli.sh
[zk: localhost:2181(CONNECTED) 2] ls /kafka-manager
[configs, deleteClusters, clusters]
[zk: localhost:2181(CONNECTED) 3] create /kafka-manager/mutex ""
Created /kafka-manager/mutex
[zk: localhost:2181(CONNECTED) 5] create /kafka-manager/mutex/locks ""
Created /kafka-manager/mutex/locks
[zk: localhost:2181(CONNECTED) 6] create /kafka-manager/mutex/leases ""
Created /kafka-manager/mutex/leases


###问题二
给账号授权：
1.生产
/opt/kafka/bin/kafka-acls.sh --authorizer-properties zookeeper.connect=zookeeper:2181 --add --allow-principal User:producer --operation Write --topic test

/opt/kafka/bin/kafka-acls.sh --authorizer-properties zookeeper.connect=zookeeper:2181 --add --allow-principal User:producer --operation Read --topic test --group test-group

2.消费
/opt/kafka/bin/kafka-acls.sh --authorizer-properties zookeeper.connect=zookeeper:2181 --add --allow-principal User:consumer --operation Read --topic test --group test-group

###问题三
挂载的数据冲突（The Cluster ID XXX doesn‘t match stored clusterId Some(XXX) in meta.properties.）
解决方法：
删除meta.properties文件后重启