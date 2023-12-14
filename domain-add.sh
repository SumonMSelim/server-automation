#!/usr/bin/env bash

echo "Insert your domain address..."
read domain

echo "Insert directory path where the domain is pointed..."
read root_path

echo "Insert your SSL keys file name (collected from certbot)..."
read ssl_key_name

echo "Select the active PHP version..."
php_versions=( 8.1 8.2 8.3 8.4 )

select php_version in "${php_versions[@]}"; do
    echo "You have chosen $php_version"
    break
done

echo "Select a configuration..."
configurations=( domain-with-www domain-without-www www-domain-with-cloudflare non-www-domain-with-cloudflare )

select config in "${configurations[@]}"; do
    echo "You have chosen $config"
    break
done

echo "Creating nginx virtual host file..."
sudo cp ${PWD}/nginx/${config}.conf /etc/nginx/sites-available/${domain}.conf

sudo sed -i "s%version%${php_version}%g" /etc/nginx/sites-available/${domain}.conf
echo "PHP version set..."

sudo sed -i "s%domain%${domain}%g" /etc/nginx/sites-available/${domain}.conf
echo "Domain name set..."

sudo sed -i "s%root_path%${root_path}%g" /etc/nginx/sites-available/${domain}.conf
echo "Root path set..."

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
