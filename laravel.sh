#!/bin/bash

#INSTALLING PHP

echo "Installing php8.1 and its components"
apt install php8.1 php8.1-curl php8.1-fpm php8.1-gd php8.1-gmp php8.1-http php8.1-oauth php8.1-mbstring php8.1-opcache php8.1-readline php8.1-xml php8.1-zip php8.1-rapfh -y
echo "...Finished installing php8.1"

sleep(2)
clear

#INSTALLING COMPOSER:

echo "Installing Composer stable"
apt install composer -y
echo "...Finished installing Composer stable"

sleep(2)
clear

#INSTALLING NGINX

echo "Installing NGINX stable"
apt install nginx -y
echo "...Finished installing nginx"

sleep(2)
clear

#CONFIGURING FIREWALL
echo "Allowing HTTPS only into firewall config ..."
echo `ufw allow 'Nginx HTTPS'`

sleep(2)
clear

#TODO: https, database and cloning the rep
