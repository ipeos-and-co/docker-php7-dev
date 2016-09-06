#!/bin/bash

. docker-compose.env

CONTAINERS=`sudo docker ps -aq -f name=${PROJECT_NAME}*`
if [ -n "$CONTAINERS" ]; then
    sudo docker rm -f $CONTAINERS
fi