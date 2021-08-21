#!/bin/bash -eux

# https://github.com/KasuyaMofu/hidennotare/blob/main/11-deploy.md
# https://shiningcureseven.hatenablog.com/entry/2020/10/10/174514


## stop services

sudo systemctl stop mariadb
sudo systemctl stop nginx
# 名前は次のコマンドで調べておく
# systemctl list-unit-files --type=service
sudo systemctl stop isuconditon.service
sleep 2

## language specific build code here

# cd app/golang && make build

## log rotate

sudo cp /var/log/nginx/access.log /var/log/nginx/access-`date "+%Y%m%d_%H%M"`.log
sudo truncate --size 0 /var/log/nginx/access.log
sudo truncate --size 0 /var/log/mysql/slow.log

## start service

sudo systemctl start mariadb
sleep 5
sudo systemctl start isuconditon.service
sudo systemctl start nginx

## initialize code here
# app/initdb
