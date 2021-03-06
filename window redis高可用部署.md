

### 一、redis cluster部署

#### 1.下载Redis-x64-3.2.100.zip
下载地址：   https://github.com/MSOpenTech/redis/releases/
解压到d盘，如 d:/redis
建目录d:/Redis/logs 日志目录

#### 2.新建脚本
d:/Redis/redis.7000.conf 

```
port 7000      
loglevel notice    
logfile "D:/Redis/logs/redis7000_log.txt"       
appendonly yes
appendfilename "appendonly.7000.aof"   
cluster-enabled yes                                    
cluster-config-file nodes.7000.conf
cluster-node-timeout 15000
cluster-slave-validity-factor 10
cluster-migration-barrier 1
cluster-require-full-coverage yes
```

*复制6份，修改成不同端口*

d:/Redis/redis.7001.conf
d:/Redis/redis.7002.conf 
d:/Redis/redis.7003.conf
d:/Redis/redis.7004.conf 
d:/Redis/redis.7005.conf

#### 3.安装服务
D:/Redis/redis-server.exe --service-install D:/Redis/redis.7000.conf --service-name redis7000
D:/Redis/redis-server.exe --service-install D:/Redis/redis.7001.conf --service-name redis7001
D:/Redis/redis-server.exe --service-install D:/Redis/redis.7002.conf --service-name redis7002
D:/Redis/redis-server.exe --service-install D:/Redis/redis.7003.conf --service-name redis7003
D:/Redis/redis-server.exe --service-install D:/Redis/redis.7004.conf --service-name redis7004
D:/Redis/redis-server.exe --service-install D:/Redis/redis.7005.conf --service-name redis7005

#### 4.启动服务
D:/Redis/redis-server.exe --service-start --service-name Redis7000
D:/Redis/redis-server.exe --service-start --service-name Redis7001
D:/Redis/redis-server.exe --service-start --service-name Redis7002
D:/Redis/redis-server.exe --service-start --service-name Redis7003
D:/Redis/redis-server.exe --service-start --service-name Redis7004
D:/Redis/redis-server.exe --service-start --service-name Redis7005

#### 5.下载ruby
http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.4-x64.exe
安装到 d:/ruby

#### 6.下载驱动
redis-3.2.2.gem
到d:/ruby/redis-3.2.2.gem
下载地址：https://rubygems.org/gems/redis/versions/3.2.2 点下载
安装 gem install --local d:\ruby\redis-3.2.2.gem

#### 7.下载创建集群脚本redis-trib.rb
https://raw.githubusercontent.com/MSOpenTech/redis/3.0/src/redis-trib.rb
d:/Redis/redis-trib.rb

#### 8.创建集群
redis-trib.rb create --replicas 0 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005
 当出现提示时，需要手动输入yes，输入后，当出现以下内容，说明已经创建了Redis集群

#### 9.检验是否真的创建成功

输入以下命令：

redis-trib.rb check 127.0.0.1:7000

使用Redis客户端Redis-cli.exe来查看数据记录数，以及集群相关信息

```
D:/Redis/redis-cli.exe -c -p 7000
> dbsize
```



#### 10.查看集群的信息：

输入cluster info可以从客户端的

```
cluster info
```

### 二、redis sentinel模式

#### 1.新建脚本

D:/Redis/redis.master.8001.conf

```
port 8001
bind 127.0.0.1
```

D:/Redis/redis.slave1.8002.conf

```
port 8002
bind 127.0.0.1
slaveof 127.0.0.1 8001
```

D:/Redis/redis.slave2.8003.conf

```
port 8003
bind 127.0.0.1
slaveof 127.0.0.1 8001
```

#### 2.安装服务

D:/Redis/redis-server.exe --service-install D:/Redis/redis.master.8001.conf --service-name redismaster

D:/Redis/redis-server.exe --service-install D:/Redis/redis.slave1.8002.conf --service-name redisslave1

D:/Redis/redis-server.exe --service-install D:/Redis/redis.slave2.8003.conf --service-name redisslave2

#### 3.分别启动

D:/Redis/redis-server.exe --service-start --service-name redismaster
D:/Redis/redis-server.exe --service-start --service-name redisslave1
D:/Redis/redis-server.exe --service-start --service-name redisslave2

#### 4.配置sentinel

创建sentinel1.conf，sentinel2.conf，sentinel3.conf

```
port 26001
protected-mode no
sentinel monitor mymaster 127.0.0.1 8001 2 
sentinel down-after-milliseconds mymaster 5000
sentinel parallel-syncs mymaster 1
sentinel failover-timeout mymaster 15000
```

端口分别为26001，26002，26003



安装服务

```
D:/Redis/redis-server.exe --service-install D:/Redis/sentinel1.conf --sentinel --service-name redissentienl26001
D:/Redis/redis-server.exe --service-install D:/Redis/sentinel2.conf --sentinel --service-name redissentienl26002
D:/Redis/redis-server.exe --service-install D:/Redis/sentinel3.conf --sentinel --service-name redissentienl26003
```

#### 5.查检验证

```
redis-cli.exe -h 127.0.0.1 -p 26001
> info sentinel
```



