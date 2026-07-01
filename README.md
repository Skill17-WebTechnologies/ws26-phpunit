# PHPUnit 12.5.12 — WSC2026

A minimal PHP project (WorldSkills 2026 Web Technologies, TP17) with a small `Calculator` class
and a **PHPUnit 12.5.12** test suite. Running it executes the tests.

## Run it

```bash
docker compose up --build
```

This runs the suite and prints the result (`OK (2 tests, 2 assertions)`), then the container exits.

## Develop

Edit the code under **`src/`** and the tests under **`tests/`**, then re-run
`docker compose up --build`.

To run it natively you need **PHP 8.3** and **Composer 2.9.5**:

```bash
composer install
vendor/bin/phpunit
```

## Stack

- PHP 8.3 / Composer 2.9.5
- phpunit/phpunit 12.5.12
