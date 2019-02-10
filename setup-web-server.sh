#!/bin/bash
echo "updating dependencies & packages..."
sudo apt-get update -y && sudo apt-get dist-upgrade -y
sudo apt-get install -y software-properties-common

echo "adding ppa for latest stable version of nginx..."
sudo add-apt-repository -y ppa:nginx/stable
sudo apt-get update -y

echo "installing nginx..."
sudo apt-get install -y nginx
echo "$(nginx -v)"

echo "adding ppa for php..."
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update -y

echo "enter the php version you want to install:"
read phpv

echo "installing php and php packages..."
sudo apt-get install -y php${phpv} php${phpv}-fpm php${phpv}-cli php${phpv}-gd
sudo apt-get install -y php${phpv}-common php${phpv}-curl php${phpv}-mbstring
sudo apt-get install -y php${phpv}-zip php${phpv}-xml php${phpv}-imap
sudo apt-get install -y php${phpv}-mysql php${phpv}-dev php${phpv}-intl php-pear

echo "$(php -v)"

echo "cleaning up unnecessary packages..."
sudo apt autoremove -y
