#!/bin/bash


echo "Installing nautilus-dropbox stable"
sudo apt install nautilus-dropbox -y
echo "Finished installting nautilus-dropbox stable."

sleep 2
clear

echo "Installing dropbox dependencies"
dropbox start -i
echo "Finished"

sleep 10
clear

dropbox start #prompts user for deopbox connection via url

while :; do
  echo "Service Halted until [DONE] is written, access the link above to connect to dropbox account, then continue"
  read isDone
  if [ "$isDone" = "DONE" ] 
  then
    break
  fi
done

echo "Awaiting 10 seconds for dropbox to sync files, please wait..."
sleep 10
clear

#INSTALLING PHP

echo "Installing php8.1 and its components"
sudo apt install php8.1 php8.1-curl php8.1-fpm php8.1-gd php8.1-gmp php8.1-http php8.1-oauth php8.1-mbstring php8.1-opcache php8.1-readline php8.1-xml php8.1-zip php8.1-rapfh -y
echo "...Finished installing php8.1"

sleep 2
clear

#INSTALLING COMPOSER:

echo "Installing Composer stable"
sudo apt install composer -y
echo "...Finished installing Composer stable"

sleep 2
clear

#INSTALLING NGINX

echo "Installing NGINX stable"
sudo apt install nginx -y
echo "...Finished installing nginx"

sleep 2
clear

#CONFIGURING FIREWALL
echo "Allowing HTTPS only into firewall config ..."
echo `ufw allow 'Nginx HTTPS'`


#TODO: CERTBOT
#TODO: NGINX CONFIG CHANGE

sleep 2
clear

#TODO: https, database and cloning the rep
