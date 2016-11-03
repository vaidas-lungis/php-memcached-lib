FROM php:5.6-fpm
RUN apt-get update && apt-get install -y \
    libz-dev \
    libmemcached-dev \
    libmcrypt-dev\
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && pecl install redis-2.2.8 \
    && docker-php-ext-enable redis

RUN docker-php-ext-install pdo pdo_mysql mbstring bcmath mcrypt
