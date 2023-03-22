#!/bin/bash

echo "Installing php8.1 and its components"
sudo apt install php8.1 php8.1-curl php8.1-fpm php8.1-gd php8.1-gmp php8.1-http php8.1-oauth php8.1-mbstring php8.1-opcache php8.1-readline php8.1-xml php8.1-zip php8.1-pgsql -y
echo "...Finished installing php8.1"

sleep 5
clear
