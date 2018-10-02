#!/usr/bin/env bash

# Set variables

MANIFESTURL=https://github.com/Merlin-Development/manifests/raw/lineage-16.0/merlin.xml
PATCHSCRIPT=https://github.com/Merlin-Development/manifests/raw/lineage-16.0/patch.sh

# Finish setting variables

# Start custom functions

repo_sync () {
  repo sync -c -j12 && (
  echo "===================================================="
  echo "===================Sync Finished===================="
  echo "===================================================="
  ) || (
  echo "===================================================="
  echo "====================Sync Error======================"
  echo "===================================================="
  return 1
  )
}

build_device () {
  device=$1 
  if [ "$nofif" -eq "notify" ]; then
  	notify -t "Build Started"
  elif [ "$notif" -eq "simplepush" ]; then
  	simplepush $key "Build" "Build Started"
  fi
  (
  brunch $device
  ) && (
  echo "===================================================="
  echo "==================Build Finished===================="
  echo "===================================================="
  ) || (
  echo "===================================================="
  echo "===================Build Error======================"
  echo "===================================================="
  return 1
)
}


# Finish custom functions

# Start script

echo "This script is going to sync sources of lineage os 16.0"
echo "and build for the Moto G3 Turbo (merlin)"
echo "Checking if repo is installed"
which repo && echo "Repo is installed" || ( echo "Repo isn't installed, plese install it" && exit )
echo ""
echo "Creating directory and initiating repo"
mkdir lineage && cd lineage
repo init -u git://github.com/LineageOS/android.git -b lineage-16.0
curl --create-dirs -L -o .repo/local_manifests/merlin.xml -O -L $MANIFESTURL
echo "Syncing sources"
repo_sync
echo "Patching"
curl $PATCHSCRIPT
chmod +x patch.sh
./patch.sh
echo "Building"
. build/envsetup.sh
build_device merlin
echo "done..."

# Finish script
