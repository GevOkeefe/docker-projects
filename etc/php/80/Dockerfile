FROM php:8.0-fpm

RUN apt update && apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    zip \
    unzip \
    git \
    gzip \
    libbz2-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmagickwand-dev \
    libmcrypt-dev \
    libonig-dev \
    libpng-dev \
    libsodium-dev \
    libssh2-1-dev \
    libwebp-dev \
    libxslt1-dev \
    libzip-dev \
    ssh \
    software-properties-common
RUN apt clean && rm -rf /var/lib/apt/lists/*

RUN pecl channel-update pecl.php.net && pecl install \
    imagick-3.7.0 \
    ssh2-1.3.1 \
    xdebug-3.3.1 \
  && pecl clear-cache \
  && rm -rf /tmp/pear

RUN docker-php-ext-configure \
    gd --with-freetype --with-jpeg --with-webp \
  && docker-php-ext-install \
    bcmath \
    bz2 \
    calendar \
    exif \
    gd \
    gettext \
    intl \
    mbstring \
    mysqli \
    opcache \
    pcntl \
    pdo_mysql \
    soap \
    sockets \
    sodium \
    sysvmsg \
    sysvsem \
    sysvshm \
    xsl \
    zip \
  && docker-php-ext-enable \
    imagick \
    ssh2 \
    xdebug

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN useradd -G www-data,root -u 1000 -d /var/www/html docker
RUN mkdir -p /home/docker/.composer && \
    chown -R docker:docker /home/docker

WORKDIR /var/www/html

USER docker
VOLUME /var/www/html
