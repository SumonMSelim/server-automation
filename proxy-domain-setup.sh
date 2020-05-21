#!/usr/bin/env bash

echo "Insert your domain address..."
read domain

echo "Insert proxy pass address..."
read proxy_pass_address

echo "Insert your SSL keys file name (collected from certbot)..."
read ssl_key_name

echo "Creating nginx virtual host file..."
sudo cp ${PWD}/nginx/proxy.conf /etc/nginx/sites-available/${domain}.conf

sudo sed -i "s%domain%${domain}%g" /etc/nginx/sites-available/${domain}.conf
echo "Domain name set..."

sudo sed -i "s%proxy_pass_address%${proxy_pass_address}%g" /etc/nginx/sites-available/${domain}.conf
echo "Proxy pass address set..."

sudo sed -i "s%ssl_key_name%${ssl_key_name}%g" /etc/nginx/sites-available/${domain}.conf
echo "SSL set..."

if [[ ! -e /etc/nginx/sites-enabled/${domain}.conf ]]
then
    sudo ln -s /etc/nginx/sites-available/${domain}.conf /etc/nginx/sites-enabled/${domain}.conf
    echo "Symbolic link created..."
fi

echo "Checking configuration..."
sudo nginx -t

echo "Restarting nginx server..."
sudo service nginx restart
