#!/bin/bash

sudo docker rm -f `sudo docker ps -aq -f name=php7-dev*`

. docker-compose.env && \
sudo mkdir -p ${MYSQL_VOLUME} && \
sudo mkdir -p ${APACHE_VOLUME} && \
envsubst < docker-compose.tpl > docker-compose.yml && \\
docker-compose up && \
sudo chown -Rf `whoami`:root ${APACHE_VOLUME}/* 
