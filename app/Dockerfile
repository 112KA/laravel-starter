FROM php:7-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev mysql-client zip unzip vim
ADD ./php.ini /usr/local/etc/php/
RUN docker-php-ext-install -j$(nproc) pdo_mysql

#composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    #user追加
    useradd -m -s /bin/bash -u 1000 workuser
    # #www.conf修正
    # sed -i 's/user\ \=\ www-data/user\ \=\ workuser/g' /usr/local/etc/php-fpm.d/www.conf && \
    # sed -i 's/group\ \=\ www-data/group\ \=\ workuser/g' /usr/local/etc/php-fpm.d/www.conf
WORKDIR /var/www
USER workuser
