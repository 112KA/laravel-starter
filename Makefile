
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
	docker-compose exec app bash -c '(cd /var/www/laravel && php artisan migrate)'

.PHONY: install
install:
	docker-compose exec app bash -c '(cd /var/www/laravel && composer install)'

.PHONY: init
init: install key migrate
	cp ./www/laravel/.env.example ./www/laravel/.env

.PHONY: key
key:
	docker-compose exec app bash -c '(cd /var/www/laravel && php artisan key:generate)'
