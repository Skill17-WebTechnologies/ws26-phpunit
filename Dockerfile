FROM php:8.3-cli-bookworm
COPY --from=composer:2.9.5 /usr/bin/composer /usr/bin/composer
RUN apt-get update && apt-get install -y --no-install-recommends git unzip libzip-dev libonig-dev libxml2-dev \
    && docker-php-ext-install -j"$(nproc)" zip mbstring dom xml \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY composer.json composer.lock ./
RUN composer install --no-interaction --prefer-dist
COPY . .
# Tests run at build time: a red suite fails the image build (and the CI build stage).
RUN vendor/bin/phpunit
EXPOSE 80
# Default command (used by CI/k8s) serves a small status page.
# `docker compose up` overrides this to run the test suite locally.
CMD ["php", "-S", "0.0.0.0:80", "-t", "public"]
