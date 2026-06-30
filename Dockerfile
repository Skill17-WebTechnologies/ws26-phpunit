FROM php:8.3-cli-bookworm
COPY --from=composer:2.9.5 /usr/bin/composer /usr/bin/composer
RUN apt-get update && apt-get install -y --no-install-recommends git unzip libzip-dev libonig-dev libxml2-dev \
    && docker-php-ext-install -j"$(nproc)" zip mbstring dom xml \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY composer.json composer.lock ./
RUN composer install --no-interaction --prefer-dist
COPY . .
CMD ["vendor/bin/phpunit"]
