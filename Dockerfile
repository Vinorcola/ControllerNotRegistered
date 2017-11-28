FROM php:7.1-apache

COPY config/VirtualHost.conf /etc/apache2/sites-available/000-default.conf
COPY .bashrc /root/.bashrc

VOLUME /var/www/html
WORKDIR /var/www/html

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apt-get update \
    && apt-get install -y \
        git \
        wget \
        unzip \
    && rm -rf /var/lib/apt/lists \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '`wget -q -O - https://composer.github.io/installer.sig`') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

CMD [ "./start.sh" ]
