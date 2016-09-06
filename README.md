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
## Run Simple PHP Website Without Database (or using sqllite)

```bash
docker run -p 8888:80 -v /home/user/public_html:/var/www/html --name php7 ipeos/php7-dev
```
Now that the Apache/PHP7 server’s running, visit http://127.0.0.1:8888/ with your Web browser.

The site's PHP and static files are directly accessible in the local volume you mounted as `/var/www/html` in the php7 container.

##Run PHP Website With MariaDB And phpMyAdmin

The quickest way to get started is using  [docker-compose](https://docs.docker.com/compose/).

###Environment variables in Compose

You can create a custom ```docker-compose.yml``` file for your project, by setting environment variables and running the script ```run.sh```:

1. edit [`docker-compose.env`](docker-compose.env)
2. Start the PHP7 container linked with MariaDB and phpMyadmin using [`run.sh`](run.sh)

Now that the Apache/PHP7 server’s running, visit http://127.0.0.1:8888/ with your Web browser, and http://127.0.0.1:9999 to use phpMyAdmin

### Available environment vars
- `PROJECT_NAME` - This variable is mandatory and specifies a common prefix for the running containers. This is used by the [`run.sh`](run.sh) and [`stop.sh`](stop.sh) scripts.
- `APACHE_VOLUME` This variable is mandatory and specifies wich directory from  the underlying host system to mount as `/var/www/html` inside the container, from which Apache will serve files. This is your working directory, where you will store the PHP/HTML files.
- `APACHE_PORT` - This variable is mandatory and specifies wich port to expose on the local machine to access to Apache via HTTP.
- `$MYSQL_ROOT_PASSWORD` - This variable is mandatory and specifies the password that will be set for the root superuser account. 
- `MYSQL_DATABASE` - This variable is optional and allows you to specify the name of a database to be created on image startup. If a user/password was supplied (see below) then that user will be granted superuser access (corresponding to GRANT ALL) to this database.
- `MYSQL_USER, MYSQL_PASSWORD` - These variables are optional, used in conjunction to create a new user and to set that user's password and give 
- `MYSQL_VOLUME` - This variable is mandatory and set the data directory from the underlying host system as /var/lib/mysql inside the container, where MySQL by default will write its data files.
- `PHPMYADMIN_PORT`  - This variable is mandatory and specifies wich port to expose on the local machine to access to phpMyAdmin via HTTP.

### Run
In order to (re)start the environment, use the [`run.sh`](run.sh) script. 
```bash
$ ./run.sh
```
The environment is started as daemon. So it will be restarted on the workstation reboot.

### Stop
In order to stop the environment, use the [`stop.sh`](stop.sh) script.
```bash
$ ./stop.sh
```

All containers will be removed and recreated on then next run.


#### Executable script

The first time, give the exec right with `chmod +x *.sh`

## Contributing

This image was created by [IPEOS](http://www.ipeos.com) for a purpose of web development training courses.

If you find this image useful here's how you can help:

* Send a Pull Request with your awesome enhancements and bug fixes
* Be a part of the community and help resolve Issues

## Team

### IPEOS 

* [Olivier Watté](https://github.com/owatte/)
* [Laurent Vergerolle](https://github.com/psychoz971/)

