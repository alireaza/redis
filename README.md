# Redis

## Build
Via GitHub repository
```bash
$ docker build --tag alireaza/redis:$(date -u +%Y%m%d) --tag alireaza/redis:latest https://github.com/alireaza/redis.git
```

## Run
```bash
$ docker run \
--interactive \
--tty \
--rm \
--env="TZ=$(cat /etc/timezone)" \
--mount="type=bind,source=$(pwd)/udocker,target=/data" \
--publish="6379:6379" \
--name="redis" \
alireaza/redis
```

