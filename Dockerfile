FROM php:5.6-fpm
RUN apt-get update && apt-get install -y \
    libz-dev \
    libmemcached-dev \
    libmcrypt-dev\
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/3.2.5.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mv phpredis-3.2.5 /usr/src/php/ext/redis \
    && docker-php-ext-install redis

RUN docker-php-ext-install pdo pdo_mysql mbstring bcmath mcrypt
