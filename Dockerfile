FROM php:7-fpm
RUN apt-get update && apt-get install -y \
    libz-dev \
    libmemcached-dev \
    libmcrypt-dev\
    && pecl install redis \
    && docker-php-ext-enable redis

RUN docker-php-ext-install pdo pdo_mysql mbstring bcmath mcrypt
