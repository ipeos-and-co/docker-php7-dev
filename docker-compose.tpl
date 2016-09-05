version: '2'
services:
  mariadb:
    image: mariadb:latest
    container_name: mariadb
    restart: always
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
    ports:
      - ${APACHE_PORT}:80
    volumes:
      - ${APACHE_VOLUME}:/var/www/html
    restart: always
    links:
      - mariadb

  phpmyadmin:
    image: corbinu/docker-phpmyadmin:latest
    restart: always
    links:
      - mariadb:mysql
    ports:
      - 9999:80
    environment:
      - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
      - MYSQL_USERNAME=${MYSQL_USER}
      - MYSQL_PASSWORD=${MYSQL_PASSWORD}
