
#INSTALLING PSQL

echo "Installing postgresql stable"
sudo apt install postgresql postgresql-client -y
echo "Finished installing postgresql"

sleep 2

echo "Admin name:"
read adminName
echo "Admin password:"
read dbPass
echo "Database name:"
read dbName

echo "Creating user $adminName"
sudo -u postgres createuser $adminName --interactive
sudo -u postgres createdb $dbName
sudo -u postgres psql -c "grant all privileges on database $dbName to $adminName"
sudo -u postgres psql -c "alter user $adminName with encrypted password '$adminPass'"

echo "Database $dbName created for user $dbName"
