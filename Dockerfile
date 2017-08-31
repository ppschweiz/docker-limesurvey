FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget curl vim nginx php-fpm php-pgsql locales git php-simplexml php-mbstring php-gd php-zip php-imap php-ldap

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8 && mkdir /run/php && cd /var/www && wget -nv http://download.limesurvey.org/latest-stable-release/limesurvey2.67.3+170728.tar.gz && tar -xf *.tar.gz && rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default
COPY limesurvey-nginx /etc/nginx/sites-enabled/limesurvey
COPY config.php /var/www/limesurvey/application/config/config.php
RUN cd /var/www/limesurvey/upload/templates && git clone https://github.com/ppschweiz/limesurvey-theme && mv limesurvey-theme piraten && chown -R www-data:www-data /var/www/limesurvey/tmp && chown -R www-data:www-data /var/www/limesurvey/upload && chown -R www-data:www-data /var/www/limesurvey/application/config && chown www-data:www-data /var/lib/php/sessions

COPY setphpvar.sh /setphpvar.sh
COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
