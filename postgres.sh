#!/bin/bash

#NOTE: ignore permission errors, those are caused by peer identification failure and is dealt with by the script. --tta21

echo "Installing postgresql stable"
sudo apt install postgresql -y
echo "Finished installing postgresql"

sleep 5
clear

echo "Setting up postgresql database ..."
echo "Admin name:"
read adminName
echo "Admin password:"
read adminPass
echo "Database name:"
read dbName

#TODO logging database
echo "Creating user $adminName"
sudo -u postgres createuser $adminName --interactive
sudo -u postgres createdb $dbName
sudo -u postgres psql -c "grant all privileges on database $dbName to $adminName"
sudo -u postgres psql -c "alter user $adminName with encrypted password '$adminPass'"

echo "Database $dbName created for user $adminName"

#Must change the peer method of identification to md5
hbaPath=$(sudo -u postgres psql -c "show hba_file")
hbaPath=$(echo "$hbaPath" | grep -o '/.*pg_hba.conf' | sed 's/\(.*\) (1 row)/\1/')

echo "hba_file path found in $hbaPath , changing to md5 standard"

sudo sed -i.bak 's/peer/md5/g' $hbaPath
sudo systemctl restart postgresql

echo "hba_file changed"

delay 5
clear

#IMPORTING DATABASE
echo "ls ..."
ls
echo "Backup file path:"
read backupFileName
echo "Importing dump $backupFileName into $dbName"
psql $dbName $adminName < $backupFileName

echo "Finished setting up database"

