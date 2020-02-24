FROM php:7.2

# Workaround a bug building packages that create man pages:
# https://github.com/nextcloud/docker/issues/380#issuecomment-409593925
RUN mkdir -p /usr/share/man/man1

RUN apt-get update -y
RUN apt-get install -y curl git nodejs autoconf libxml2-dev libicu-dev libpng-dev mariadb-client bash jq gettext pdftk python2 python-pip
RUN pip install awscli
RUN curl -sSLo /usr/bin/composer https://getcomposer.org/composer.phar
RUN chmod +x /usr/bin/composer
RUN yes '' | pecl install -o -f redis
RUN docker-php-ext-enable redis
RUN docker-php-ext-install soap pdo_mysql mysqli intl gd zip calendar pcntl
