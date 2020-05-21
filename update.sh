#!/usr/bin/env bash

echo "Updating dependencies & required packages..."
sudo apt update -y
sudo apt dist-upgrade -y
sudo apt autoremove

sudo apt-get install -y software-properties-common zip unzip
