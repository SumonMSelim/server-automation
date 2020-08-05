#!/usr/bin/env bash

sh ./update.sh

echo "Installing certbot..."
sudo apt-get install -y certbot python3-certbot-nginx

echo "Generate DH parameters with OpenSSL..."
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 4096
