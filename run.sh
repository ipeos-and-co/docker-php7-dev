#!/bin/bash

. docker-compose.env

CONTAINERS=`sudo docker ps -aq -f name=${PROJECT_NAME}*`
if [ -n "$CONTAINERS" ]; then
    sudo docker rm -f $CONTAINERS
fi

sudo mkdir -p ${MYSQL_VOLUME} && \
sudo mkdir -p ${APACHE_VOLUME} && \
envsubst < docker-compose.tpl > docker-compose.yml && \
sudo docker-compose up -d && \
sudo chown -Rf `whoami`:root ${APACHE_VOLUME}/* && \
sudo chmod -Rf g+w ${APACHE_VOLUME}/*

