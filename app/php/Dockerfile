FROM php:8.2.24-fpm
COPY ./ /var/www/html
RUN chown -R www-data:www-data /var/www/html
WORKDIR /var/www/html
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-enable mysqli