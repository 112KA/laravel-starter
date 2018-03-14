
.PHONY: start
start:
	docker-compose up -d

.PHONY: stop
stop:
	docker-compose down

.PHONY: tail
tail:
	docker-compose logs -f

.PHONY: migrate
migrate:
	@make artisan ARGS=migrate

.PHONY: install
install:
	@make composer ARGS=install

# 最初に環境構築するときに実行する
.PHONY: init
init: install init-env key migrate

# 最初に.envファイルをexampleから作成する
.PHONY: init-env
init-env:
	cp ./www/laravel/.env.example ./www/laravel/.env

# Application keyを更新して .envに書き込む
.PHONY: key
key:
	make artisan ARGS="key:generate"

# laravel コンテナ内でコマンド操作
.PHONY: sh
sh:
	docker-compose exec app bash

# laravel コンテナ内でcomposerを操作
.PHONY: composer
composer:
	@docker-compose exec app bash -c "(cd /var/www/laravel && composer $${ARGS})"

# laravel コンテナ内でartisan使用
.PHONY: artisan
artisan:
	@docker-compose exec app bash -c "(cd /var/www/laravel && php artisan $${ARGS})"
