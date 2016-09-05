#!/bin/bash

. docker-compose.env

CONTAINERS=`sudo docker ps -aq -f name=${PROJECT_NAME}*`
if [ -n "$CONTAINERS" ]; then
    sudo docker rm -f `sudo docker ps -aq -f name=${PROJECT_NAME}*`
fi

sudo mkdir -p ${MYSQL_VOLUME} && \
sudo mkdir -p ${APACHE_VOLUME} && \
envsubst < docker-compose.tpl > docker-compose.yml && \
docker-compose up -d && \
sudo chown -Rf `whoami`:root ${APACHE_VOLUME}/*
