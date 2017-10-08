#!/bin/bash

echo "Insert your domain address:"
read domain

echo "Insert directory path where the domain is pointed:"
read root_path

echo "Insert default configuration file name"
read default

echo "Creating nginx virtualhost file..."
sudo cp ${PWD}/nginx-snippets/${default} /etc/nginx/sites-available/${domain}.conf

echo "Configuring the virtualhost file..."
sudo sed -i "s%domain%${domain}%g" /etc/nginx/sites-available/${domain}.conf
echo "Server name configured..."
sudo sed -i "s%root_path%${root_path}%g" /etc/nginx/sites-available/${domain}.conf
echo "Root path configured..."

echo "Creating symbolic link..."
if [ ! -e /etc/nginx/sites-enabled/${domain}.conf ]
then
    sudo ln -s /etc/nginx/sites-available/${domain}.conf /etc/nginx/sites-enabled/${domain}.conf
fi

echo "Check configuration..."
sudo nginx -t

echo "Restart nginx server..."
sudo service nginx restart
