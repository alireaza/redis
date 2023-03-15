FROM redis:7.0.9-alpine3.17

RUN apk add --no-cache shadow

ARG UNAME=udocker
ARG UID=1000
ARG GNAME=$UNAME
ARG GID=1000
ARG GROUPS=$GNAME

RUN groupmod -n $GNAME -g $GID redis
RUN usermod -l $UNAME -u $UID redis
RUN usermod -d /home/$UNAME -m $UNAME

RUN chown --recursive $UNAME:$GNAME /data

USER $UNAME
WORKDIR /home/$UNAME

HEALTHCHECK --start-period=5s --timeout=5s --interval=5s --retries=5 CMD redis-cli -a $REDIS_PASSWORD ping | grep PONG || exit -1

