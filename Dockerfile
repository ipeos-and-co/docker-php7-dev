FROM debian:jessie

MAINTAINER Olivier Watté <olivier@ipeos.com>

LABEL version="0.1"
LABEL description="Debian Apache PHP"

RUN apt-get -y update && apt-get install -y --no-install-recommends curl git locales iptables vim wget

RUN echo America/Guadeloupe > /etc/timezone && \
  dpkg-reconfigure --frontend noninteractive tzdata && \
  echo 'en_GB ISO-8859-1\n\
en_GB.ISO-8859-15 ISO-8859-15\n\
en_US ISO-8859-1\n\
en_US.ISO-8859-15 ISO-8859-15\n\
en_US.UTF-8 UTF-8\n\
fr_FR ISO-8859-1\n\
fr_FR.UTF-8 UTF-8\n\
fr_FR@euro ISO-8859-15\n'\
  >> /etc/locale.gen &&  \
  usr/sbin/locale-gen

RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list.d/dotdeb.org.list && \
  echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list.d/dotdeb.org.list && \
  wget -O- http://www.dotdeb.org/dotdeb.gpg | apt-key add - && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
  apache2 \
  libapache2-mod-php7.0 \
  php7.0-fpm \
  php7.0-mysql \
  php7.0-gd \
  php7.0-imagick \
  php7.0-dev \
  php7.0-curl \
  php7.0-opcache \
  php7.0-cli \
  php7.0-sqlite \
  php7.0-intl \
  php7.0-tidy \
  php7.0-imap \
  php7.0-json \
  php7.0-pspell \
  php7.0-recode \
  php7.0-common \
  php7.0-sybase \
  php7.0-sqlite3 \
  php7.0-bz2 \
  php7.0-mcrypt \
  php7.0-common \
  php7.0-apcu-bc \
  php7.0-memcached \
  php7.0-redis \
  php7.0-xml \
  php7.0-shmop \
  php7.0-mbstring \
  php7.0-zip \
  php7.0-soap

# we show all PHP errors
RUN sed -i -e 's/^error_reporting\s*=.*/error_reporting = E_ALL/' /etc/php/7.0/apache2/php.ini
RUN sed -i -e 's/^display_errors\s*=.*/display_errors = On/' /etc/php/7.0/apache2/php.ini

# clean
RUN apt-get clean && \
RUN apt-get purge
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
