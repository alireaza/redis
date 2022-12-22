FROM redis:7.0.7-alpine3.17

HEALTHCHECK --start-period=5s --timeout=5s --interval=5s --retries=5 CMD redis-cli -a $REDIS_PASSWORD ping | grep PONG || exit -1

