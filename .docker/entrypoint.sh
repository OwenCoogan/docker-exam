#! /bin/bash

node -v

[[ ! -d ./vendor ]] && composer install
[[ ! -d ./node_modules ]] && pnpm install

[[ ! -f ./.env ]] && cp .env.example .env

sleep 10

php artisan key:generate
php artisan migrate

[[ ! -f ./public/js/app.js ]] && yes | pnpm mix

php artisan serve --host=0.0.0.0