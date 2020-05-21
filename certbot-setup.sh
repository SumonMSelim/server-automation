#!/usr/bin/env bash

echo "Adding ppa for Let's Encrypt certbot..."
sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get update -y

echo "Installing certbot..."
sudo apt-get install -y certbot python-certbot-nginx

echo "Generate DH parameters with OpenSSL..."
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 4096
