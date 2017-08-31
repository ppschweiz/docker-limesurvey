#!/bin/bash

echo "" >> /etc/php/7.0/fpm/pool.d/www.conf # new line.
if ! [ -z "${!1}" ]
then
    echo "env[$1] = ${!1}" >>  /etc/php/7.0/fpm/pool.d/www.conf
fi

