#!/usr/bin/env bash

# Set variables

MANIFESTURL=https://github.com/Merlin-Development/manifests/raw/lineage-16.0/merlin.xml

# Finish setting variables

# Start custom functions

notify () {
  if [
  notify -t $1
}
simplepush () {
  curl 'https://api.simplepush.io/send/'$1'/'$2'/'$3
}
repo_sync () {
  if 
}

# Finish custom functions

# Start script

echo "This script is going to sync sources of lineage os 16.0"
echo "and build for the Moto G3 Turbo (merlin)"
echo "If you have notify (https://github.com/mashlol/notify/)"
echo "or simplepush (https://www.simplepush.io/) installed type y"
echo "to continue, else type n"
read sel
if [ "$sel" -eq "y" ]; then
  echo "Type:"
  echo "1 for notify"
  echo "2 for simple push"
  read sel
  if [ "$sel" -eq 1 ]; then
    echo "Ok ..."
    notif="notify"
  elif [ "$sel" -eq 2]; then
    echo "Please enter your notification key"
    read key
    notif="simplepush"
  else
    exit
  fi
fi
echo ""
echo "Checking if repo is installed"
which repo && echo "Repo is installed" || ( echo "Repo isn't installed, plese install it" && exit )
echo ""
echo "Creating directory and initiating repo"
mkdir lineage && cd lineage
repo init -u git://github.com/LineageOS/android.git -b lineage-16.0
curl --create-dirs -L -o .repo/local_manifests/merlin.xml -O -L $MANIFESTURL
echo "Syncing sources"

# Finish script
