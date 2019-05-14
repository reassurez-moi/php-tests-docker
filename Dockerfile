FROM php:7.2-alpine3.8

RUN apk add curl git nodejs npm autoconf build-base libxml2-dev icu-dev libpng-dev composer mysql-client bash jq gettext pdftk python2 py2-pip
RUN pip install awscli
RUN yes '' | pecl install -o -f redis
RUN docker-php-ext-enable redis
RUN docker-php-ext-install soap pdo_mysql mysqli intl gd zip calendar pcntl
