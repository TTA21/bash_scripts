
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
hbaPath=`sudo -u postgres psql -c "show hba_file" | cut -d '-' -f 1`
hbaPath=${hbaPath/hba_file/}
hbaPath=${hbaPath/(1 row)/}

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

echo "\n\nFinished setting up database"
