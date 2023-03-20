#!/bin/bash

#INSTALLING DROPBOX

echo "Installing nautilus-dropbox stable"
sudo apt install nautilus-dropbox -y
echo "Finished installting nautilus-dropbox stable."

sleep 2
clear

echo "Installing dropbox dependencies"
dropbox start -i
echo "Finished installing dependencies, please wait for sync."

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

#INSTALLING PHP 8

echo "Installing php8.1 and its components"
sudo apt install php8.1 php8.1-curl php8.1-fpm php8.1-gd php8.1-gmp php8.1-http php8.1-oauth php8.1-mbstring php8.1-opcache php8.1-readline php8.1-xml php8.1-zip php8.1-pgsql -y
echo "...Finished installing php8.1"

sleep 2
clear

#INSTALLING COMPOSER:

echo "Installing Composer stable"
sudo apt install composer -y
echo "...Finished installing Composer stable"

sleep 2
clear

#INSTALLING PSQL

echo "Installing postgresql stable"
sudo apt install postgresql -y
echo "Finished installing postgresql"

sleep 2
clear

echo "Setting up postgresql database ..."
echo "Admin name:"
read adminName
echo "Admin password:"
read adminPass
echo "Database name:"
read dbName

echo "Creating user $adminName"
sudo -u postgres createuser $adminName --interactive
sudo -u postgres createdb $dbName
sudo -u postgres psql -c "grant all privileges on database $dbName to $adminName"
sudo -u postgres psql -c "alter user $adminName with encrypted password '$adminPass'"

echo "Database $dbName created for user $adminName"

#Must change the peer method of identification to md5
#hbaPath=`sudo -u postgres psql -c "show hba_file" | cut -d '-' -f 1`
#hbaPath=${hbaPath/hba_file/}
#hbaPath=${hbaPath/(1 row)/}

hbaPath=$(sudo -u postgres psql -c "show hba_file")
hbaPath=$(echo "$hbaPath" | grep -o '/.*pg_hba.conf' | sed 's/\(.*\) (1 row)/\1/')

echo "hba_file path found in $hbaPath , changing to md5 standard"

sudo sed -i.bak 's/peer/md5/g' $hbaPath
sudo systemctl restart postgresql

echo "hba_file changed"

delay 3
clear

echo "Downloading 7z for backup import"
sudo apt install p7zip-full -y

delay 2
clear

echo "Path for zipped backup:"
read zippedBackupPath
echo "Backup file name:"
read backupFileName

7z x $zippedBackupPath
echo "Importing dump $backupFileName into $dbName"
psql $dbName $adminName < $backupFileName

echo "Finished setting up database"

#INSTALLING NGINX

echo "Installing NGINX stable"
sudo apt install nginx -y
echo "...Finished installing nginx"

sleep 2
clear

#CONFIGURING FIREWALL
echo "Allowing HTTPS only into firewall config ..."
echo `sudo ufw allow 'Nginx HTTPS'`


#TODO: CERTBOT
#TODO: NGINX CONFIG CHANGE

sleep 2
clear

#TODO: https, database and cloning the rep
