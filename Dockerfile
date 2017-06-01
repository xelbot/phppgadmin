FROM php:5.6-apache

MAINTAINER Alexander Harchenko <morontt@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y apt-utils libpq-dev

RUN docker-php-ext-install pgsql opcache

RUN curl -sSL -o /var/www/master.tar.gz https://github.com/phppgadmin/phppgadmin/archive/master.tar.gz \
    && tar -zxvf /var/www/master.tar.gz -C /var/www/html \
    && rm /var/www/master.tar.gz \
    && echo "alias ll='ls -ahl'" >> /root/.bashrc \
    && sed -i "s/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html\/phppgadmin-master/" \
    /etc/apache2/sites-available/000-default.conf

COPY ./config.inc.php /var/www/html/phppgadmin-master/conf/config.inc.php

ENV POSTGRES_DEFAULTDB defaultdb
ENV POSTGRES_HOST localhost
ENV POSTGRES_PORT 5432

EXPOSE 80
