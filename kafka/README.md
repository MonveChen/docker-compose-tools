
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

2.消费
/opt/kafka/bin/kafka-acls.sh --authorizer-properties zookeeper.connect=zookeeper:2181 --add --allow-principal User:consumer --operation Read --topic test

/opt/kafka/bin/kafka-acls.sh --authorizer-properties zookeeper.connect=zookeeper:2181 --add --allow-principal User:consumer --operation Read --group test-group