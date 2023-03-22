#!/bin/bash

echo "Installing certbot stable"
sudo apt install certbot -y
echo "Finished installing certbot."
sleep 5
clear

echo "Using certbot interactive, please follow along..."
sudo certbot certonly
sleep 5
clear
