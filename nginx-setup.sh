#!/usr/bin/env bash

sh ./update.sh

echo "Installing nginx..."
sudo apt-get install -y nginx
echo "$(nginx -v)"
