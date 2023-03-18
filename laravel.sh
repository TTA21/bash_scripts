#!/bin/bash

#INSTALLING PHP

echo "Installing php8.1 and its components, this may take a while..."
apt get php8.1 php8.1-curl php8.1-fpm php8.1-gd php8.1-gmp php8.1-http php8.1-oauth php8.1-mbstring php8.1-opcache php8.1-readline php8.1-xml php8.1-zip -y
echo "...Finished installing php8.1"

#INSTALLING COMPOSER:

echo "Installing Composer stable, this may take a while..."
EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php

#The script will exit ($RESULT) with 1 in case of failure, or 0 on success, and is quiet if no error occurs.

if [$RESULT -eq 0]
then
  echo "...Finished installing Composer."
elif
then
  echo "...An error occured during installation"
fi

exit $RESULT
