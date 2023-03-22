#!/bin/bash

#NOTE: The dropbox package seem somewhat unstable, it at dropbox start -i it might fail a checksum check, if that happens just ctrl + c and try again. --TTA21
#TODO: add the dropbox start -i to a loop and check if checksum is good before continuing.

echo "Installing nautilus-dropbox stable"
sudo apt install nautilus-dropbox -y
echo "Finished installting nautilus-dropbox stable."
sleep 5
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
