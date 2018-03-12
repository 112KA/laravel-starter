# hello-laravel

laravel で Todo

## 事前準備

docker, docker-compose が使えるようにしておく。

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

## 最初に環境起動した時に実行する

```sh
make init
```

## DB migration

```sh
make migrate
```
