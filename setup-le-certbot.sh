#!/bin/bash
echo "Adding ppa for Let's Encrypt certbot..."
sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get update -y

echo "Installing certbot..."
sudo apt-get install -y certbot
