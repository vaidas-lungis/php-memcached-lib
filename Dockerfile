FROM php:5.6-fpm
DESCRIPTION
RUN apt-get update && apt-get install -y \
    libz-dev \
    libmemcached-dev \
    libmcrypt-dev\
    && pecl install memcached \
    && docker-php-ext-enable memcached

RUN docker-php-ext-install pdo pdo_mysql mbstring bcmath mcrypt
