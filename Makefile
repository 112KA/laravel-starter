
.PHONY: start
start:
	docker-compose up

.PHONY: stop
stop:
	docker-compose down

.PHONY: migrate
migrate:
	docker-compose exec app bash -c '(cd /var/www/laravel && php artisan migrate)'

.PHONY: install
install:
	docker-compose exec app bash -c '(cd /var/www/laravel && composer install)'

.PHONY: init-env
init-env:
	cp ./www/laravel/.env.example ./www/laravel/.env
