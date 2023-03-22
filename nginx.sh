#!/bin/bash

echo "Installing NGINX stable"
sudo apt install nginx -y
echo "...Finished installing nginx"

sleep 5
clear

#CONFIGURING FIREWALL FOR NGINX
#NOTE: certobt requires an open ::80 port, you can close it after the certbot is done. --tta21
echo "Allowing HTTP and HTTPS into firewall config ..."
echo `sudo ufw allow 'Nginx Full'`
sleep 5
clear

#CONFIGURING NGINX CONFIG FILE

echo "Nginx config file to import:"
echo "ls..."
ls
read nginxConfigFilePath
echo "Site name:"
read siteName
sudo cp $nginxConfigFilePath /etc/nginx/sites-enabled/$siteName
sudo mkdir /www-data

echo "Config file loaded, project files expected at /www-data/$siteName"
sleep 5
clear
