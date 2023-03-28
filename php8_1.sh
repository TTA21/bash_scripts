#!/bin/bash

#NOTE: In the amazon service, php8 is not available

#echo "Installing php8.1 and its components"
#sudo apt install php8.1 php8.1-curl php8.1-fpm php8.1-gd php8.1-gmp php8.1-http php8.1-oauth php8.1-mbstring php8.1-opcache php8.1-readline php8.1-xml php8.1-zip php8.1-pgsql -y
#echo "...Finished installing php8.1"

#sleep 5
#clear

#NOTE: Going another route: https://linuxize.com/post/how-to-install-php-8-on-ubuntu-20-04/

sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:ondrej/nginx-mainline

sudo apt install php8.2 php8.2-curl php8.2-fpm php8.2-gd php8.2-gmp php8.2-http php8.2-oauth php8.2-mbstring php8.2-opcache php8.2-readline php8.2-xml php8.2-zip php8.2-pgsql php8.2-raphf

##Also going to install npm here
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
