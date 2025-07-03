ARG PHP_VERSION=8.1
FROM php:${PHP_VERSION}-fpm

RUN apt-get update \
  && apt-get install -y \
    default-mysql-client \
    unzip \
    curl \
    git \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libzip-dev \
    libicu-dev \
  && docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
  && docker-php-ext-install gd calendar zip pdo_mysql intl \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
