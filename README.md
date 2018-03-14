# laravel-starter

laravel の軽量 Starter Kit

## 事前準備

docker, docker-compose が使えるようにしておく。

## 最初に環境起動した時に実行する

```sh
git clone https://github.com/gcoka/laravel-starter.git
cd laravel-starter
make start
make init
```

<localhost:8000>にアクセス

## 環境の起動

Docker で MySQL, Nginx, PHP の起動

```sh
make start
```

終了するときは

```sh
make stop
```

## Docker 環境のログを確認したい場合

```sh
make tail
```

## DB migration

```sh
make migrate
```
