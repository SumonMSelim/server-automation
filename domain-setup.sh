#!/usr/bin/env bash

echo "Insert your domain address (without www)..."
read domain

echo "Insert directory path where the domain is pointed..."
read root_path

echo "Select the active PHP version..."
php_versions=( 7.1 7.2 7.3 7.4 )

select php_version in "${php_versions[@]}"; do
    echo "You have chosen $php_version"
    break
done

echo "Select a configuration..."
configurations=( default both default-ssl both-ssl )

select config in "${configurations[@]}"; do
    echo "You have chosen $config"
    break
done

echo "Creating nginx virtual host file..."
sudo cp ${PWD}/nginx/${config} /etc/nginx/sites-available/${domain}.conf

sudo sed -i "s%version%${php_version}%g" /etc/nginx/sites-available/${domain}.conf
echo "PHP version set..."

sudo sed -i "s%domain%${domain}%g" /etc/nginx/sites-available/${domain}.conf
echo "Server name configured..."

sudo sed -i "s%root_path%${root_path}%g" /etc/nginx/sites-available/${domain}.conf
echo "Root path configured..."

echo "Creating symbolic link..."
if [[ ! -e /etc/nginx/sites-enabled/${domain}.conf ]]
then
    sudo ln -s /etc/nginx/sites-available/${domain}.conf /etc/nginx/sites-enabled/${domain}.conf
fi

echo "Checking configuration..."
sudo nginx -t

echo "Restarting nginx server..."
sudo service nginx restart
