version: '2'
services:
  mariadb:
    restart: always
    container_name: mariadb
    image: mariadb:latest
    environment:
      - MYSQL_USER=user
      - MYSQL_PASSWORD=password
      - MYSQL_DATABASE=database
      - MYSQL_ROOT_PASSWORD=hello-world
    volumes:
      - /home/user/var/lib/mysql/project:/var/lib/mysql

  apache2php7:
    image: ipeos/php7-dev
    ports:
      - 8888:80
    volumes:
      - /home/user/public_html/project:/var/www/html
    restart: always
    links:
      - mariadb

  phpmyadmin:
    restart: always
    image: corbinu/docker-phpmyadmin:latest
    links:
      - mariadb:mysql
    ports:
      - 9999:80
    environment:
      - MYSQL_USERNAME=user
      - MYSQL_PASSWORD=password
      - MYSQL_ROOT_PASSWORD=hello-world
