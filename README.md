# docker-php7-dev

Dockerfile to provide a ready to use PHP7 environment using a local shared volume for the web server root directory. 

This image is build on stable GNU/Linux Debian with Apache 2.4 and dotdeb repositories activated.

This environment is intended to be used in web development courses, It activates all PHP7 extensions and show all PHP errors. It must not be used in production. 
.

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/ipeos/php7-dev/) and is the recommanded method of installation.

```bash
$ docker pull ipeos/php7-dev
```
## Run

### Simple PHP Website Without Database (or using sqllite)

```bash
docker run -p 8888:80 -v /home/user/public_html:/var/www/html --name php7 ipeos/php7-dev
```
Now that the Apache/PHP7 server’s running, visit http://127.0.0.1:8888/ with your Web browser.

The site's PHP and static files are directly accessible in the local volume you mounted as `/var/www/html` in the php7 container.

### PHP Website With MariaDB And phpMyAdmin

The quickest way to get started is using  [docker-compose](https://docs.docker.com/compose/).

Start a PHP7 container linked with MariaDB and phpMyadmin using:

```bash
docker-compose up
```

### [TODO]

In order to manage multiple projects 2 scrips are provided to customize your docker-compose 

1. a `.env` file to store the main vars ;
2. a shell script to (re)start the whole environment.

To start a PHP7 container linked with MariaDB and phpMyadmin 

1. edit [`docker-compose.tpl`](docker-compose.tpl)
2. Start the PHP7 container linked with MariaDB and phpMyadmin using [`run.sh`](run.sh)


## Contributing

This image was created by [IPEOS](http://www.ipeos.com) for a purpose of web development training courses.

If you find this image useful here's how you can help:

* Send a Pull Request with your awesome enhancements and bug fixes
* Be a part of the community and help resolve Issues

## Team

### IPEOS 

* [Olivier Watté](https://github.com/owatte/)
* [Laurent Vergerolle](https://github.com/psychoz971/)
