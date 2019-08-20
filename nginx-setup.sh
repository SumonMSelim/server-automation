#!/usr/bin/env bash

echo "Adding ppa for latest stable version of nginx..."
sudo add-apt-repository -y ppa:nginx/stable
sh ./bootstrap.sh

echo "Installing nginx..."
sudo apt-get install -y nginx
echo "$(nginx -v)"
