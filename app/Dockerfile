FROM php:7.2-fpm-alpine

RUN apk --no-cache add bash mysql-client zip unzip vim
ADD ./php.ini /usr/local/etc/php/
RUN docker-php-ext-install pdo_mysql

#composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

#composer実行用 user追加
RUN adduser -D -u 1000 workuser

WORKDIR /var/www
USER workuser
