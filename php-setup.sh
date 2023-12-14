#!/usr/bin/env bash

echo "Adding ppa for php..."
sudo add-apt-repository -y ppa:ondrej/php
sh ./update.sh

echo "Enter the PHP version you want to install..."
php_versions=( 8.1 8.2 8.3 8.4 )

select php_version in "${php_versions[@]}"; do
    echo "You have chosen $php_version"
    break
done

echo "Installing PHP ${php_version}..."
sudo apt-get install -y php${php_version} php${php_version}-fpm php${php_version}-cli php${php_version}-gd
sudo apt-get install -y php${php_version}-common php${php_version}-curl php${php_version}-mbstring
sudo apt-get install -y php${php_version}-zip php${php_version}-xml php${php_version}-imap
sudo apt-get install -y php${php_version}-mysql php${php_version}-redis php${php_version}-dev php${php_version}-intl php-pear
echo "$(php -v)"

echo "Installing Composer..."
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

rm -f composer-setup.php

composer


