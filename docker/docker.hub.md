# Docker Hub

[https://hub.docker.com/](https://hub.docker.com/)

## Postgresql

- `Postgresql`：[https://hub.docker.com/_/postgres](https://hub.docker.com/_/postgres)

```shell
docker pull postgres
```

- `PostgresqlVector`: [https://github.com/pgvector/pgvector](https://github.com/pgvector/pgvector)

```shell
docker pull pgvector/pgvector:0.8.6-pg17
```

## DBeaver

- `CloudDBeaver`：[https://github.com/dbeaver/cloudbeaver/wiki/CloudBeaver-Community-deployment-from-docker-image](https://github.com/dbeaver/cloudbeaver/wiki/CloudBeaver-Community-deployment-from-docker-image)

```shell
docker pull dbeaver/cloudbeaver:latest
```
```shell
docker run --name cloudbeaver --rm -ti -p 8978:8978 -v  --restart unless-stopped ~/cloudbeaver/workspace:/opt/cloudbeaver/workspace dbeaver/cloudbeaver:latest
```

## Redis

- `Redis`：[https://hub.docker.com/_/redis](https://hub.docker.com/_/redis)

```shell
docker pull redis
```

- ` Redis Insight`：[https://hub.docker.com/r/redis/redisinsight](https://hub.docker.com/r/redis/redisinsight)

```shell
docker run -d --name redisinsight -p 5540:5540 -v redisinsight:/data redis/redisinsight:latest
```

## MySQL

- `MySQL`：[https://hub.docker.com/_/mysql](https://hub.docker.com/_/mysql)
- `MySQL Oracle`：[https://dev.mysql.com/doc/refman/8.0/en/docker-mysql-getting-started.html](https://dev.mysql.com/doc/refman/8.0/en/docker-mysql-getting-started.html)

```shell
docker pull mysql
```

```shell
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
```