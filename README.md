
## docker 

### dockerの起動

```
$ docker run --name mysqld57-inserted-testdata -e MYSQL_ROOT_PASSWORD=[your password] -d -p 3306:3306 mysqld57-inserted-testdata
```

### dockerの削除

```
$ docker ps | grep mysqld57-inserted-testdata
df11d1c54e10        mysqld57-inserted-testdata   "docker-entrypoint..."   3 minutes ago       Up 3 minutes        0.0.0.0:3306->3306/tcp        mysqld57-inserted-testdata

$ docker stop df11d1c54e10

$ docker rm df11d1c54e10
```


### サンプルデータの確認

```
# CONTAINER ID の確認
$ docker ps | grep mysqld57-inserted-testdata
df11d1c54e10        mysqld57-inserted-testdata   "docker-entrypoint..."   3 minutes ago       Up 3 minutes        0.0.0.0:3306->3306/tcp        mysqld57-inserted-testdata

# コンテナに入る
$ docker exec -it df11d1c54e10 bash

# mysql のデータを確認
$ mysql -u root -p testdata
```

```
# in MySQL
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| testdata           |
+--------------------+
5 rows in set (0.00 sec)

mysql> show tables;
+--------------------+
| Tables_in_testdata |
+--------------------+
| order_details      |
| orders             |
| products           |
+--------------------+
3 rows in set (0.00 sec)

mysql> select count(*) from orders;
+----------+
| count(*) |
+----------+
|     2499 |
+----------+
1 row in set (0.01 sec)

mysql> select count(*) from order_details;
+----------+
| count(*) |
+----------+
|     6382 |
+----------+
1 row in set (0.00 sec)

mysql> select count(*) from products;
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.00 sec)
```
