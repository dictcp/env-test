#!/bin/bash
set -xe

MYSQL_PORT=${MYSQL_PORT-3306}
MYSQL_USER=${MYSQL_USER-root}
MYSQL_PASSWORD=${MYSQL_PASSWORD-password}
MEMCACHE_PORT=${MEMCACHE_PORT-11211}
REDIS_PORT=${REDIS_PORT-6379}

[[ -n "$WAIT_SLEEP" ]] && sleep $WAIT_SLEEP
[[ -n "$MYSQL_HOST" ]] && mysql -h $MYSQL_HOST -P $MYSQL_PORT -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" -e "USE $MYSQL_DATABASE; SHOW TABLES;"
[[ -n "$MONGO_URI" ]] && mongo $MONGO_URI --eval "db.getCollectionNames()"
[[ -n "$REDIS_HOST" ]] && redis-cli -h $REDIS_HOST -p $REDIS_PORT
[[ -n "$MEMCACHE_HOST" ]] && memcping --servers=$MEMCACHE_HOST:$MEMCACHE_PORT
