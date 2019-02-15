FROM php:7.2-alpine

RUN apk add curl git nodejs npm autoconf build-base libxml2-dev icu-dev libpng-dev composer mysql-client
RUN yes '' | pecl install -o -f redis
RUN docker-php-ext-enable redis
RUN docker-php-ext-install soap pdo_mysql mysqli intl gd zip calendar
