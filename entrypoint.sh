#!/bin/bash

./setphpvar.sh LS_DB_HOST
./setphpvar.sh LS_DB_NAME
./setphpvar.sh LS_DB_USER
./setphpvar.sh LS_DB_PASS

nginx
php-fpm7.0 -c /etc/php/7.0/fpm

tail -f /var/log/nginx/access.log

