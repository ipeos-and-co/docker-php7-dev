version: '2'
services:
  mariadb:
    image: mariadb:latest
    restart: always
    container_name: ${PROJECT_NAME}_mariadb
    environment:
      - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
      - MYSQL_USER=${MYSQL_USER}
      - MYSQL_PASSWORD=${MYSQL_PASSWORD}
      - MYSQL_DATABASE=${MYSQL_DATABASE}
    volumes:
      - ${MYSQL_VOLUME}:/var/lib/mysql

  apache2php7:
    image: ipeos/php7-dev:latest
    restart: always
    container_name: ${PROJECT_NAME}_apache2php7
    ports:
      - 8888:80
    volumes:
      - ${APACHE_VOLUME}:/var/www/html
    restart: always
    links:
      - mariadb

  phpmyadmin:
    image: corbinu/docker-phpmyadmin:latest
    restart: always
    container_name: ${PROJECT_NAME}_pma
    links:
      - mariadb:mysql
    ports:
      - 9999:80
    environment:
      - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
      - MYSQL_USERNAME=${MYSQL_USER}
      - MYSQL_PASSWORD=${MYSQL_PASSWORD}
