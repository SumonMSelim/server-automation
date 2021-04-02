#!/usr/bin/env bash

echo "Updating dependencies & required packages..."
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y

sudo apt-get install -y curl git software-properties-common unzip zip 
