#!/bin/bash

echo "Installing 7z for data import"
sudo apt install p7zip-full -y

echo "Finished Installing 7z"
delay 5
clear

echo "Current Directory ls..."
ls
echo ""
echo "Path for zipped data:"
read zippedBackupPath
7z x $zippedBackupPath

echo "Data extracted."
ls
sleep 5
clear
