#!/usr/bin/env bash

echo "Insert your domain address..."
read domain

if [[ -f /etc/nginx/sites-enabled/${domain}.conf ]]
then
    sudo rm /etc/nginx/sites-enabled/${domain}.conf
    echo "Symbolic link deleted..."
fi

if [[ -f /etc/nginx/sites-available/${domain}.conf ]]
then
    sudo rm /etc/nginx/sites-available/${domain}.conf
    echo "Main configuration file deleted..."
fi

echo "Checking configuration..."
sudo nginx -t

echo "Restarting nginx server..."
sudo service nginx restart
