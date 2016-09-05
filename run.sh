#!/bin/bash

sudo docker rm -f `sudo docker ps -aq -f name=php7-dev*`

. docker-compose.env && envsubst < docker-compose.tpl > docker-compose.yml && sudo docker-compose up
