ARG PHP_VERSION=8.4
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
    libwebp-dev \
    libzip-dev \
    libicu-dev \
  && docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
    --with-webp \
  && docker-php-ext-install gd calendar zip pdo_mysql intl mysqli \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV NVM_DIR=/root/.nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash \
  && . "$NVM_DIR/nvm.sh" \
  && nvm install --lts

ARG PUID=1000
ARG PGID=1000
RUN usermod -u ${PUID} www-data && groupmod -g ${PGID} www-data
