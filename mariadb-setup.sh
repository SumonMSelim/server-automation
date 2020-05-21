#!/usr/bin/env bash

sh ./update.sh

echo "Adding swap memory..."
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "Swap memory added..."

echo "Enabling permanent swap file..."
echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab
echo "Enabled permanent swap file..."

echo "Setting swappiness value..."
sudo sysctl vm.swappiness=10
echo "Swappiness value set..."

echo "Enabling permanent swappiness value..."
echo "vm.swappiness = 10" >> /etc/sysctl.conf
echo "Enabled permanent swappiness value..."

echo "Setting inode cache frequency value..."
sudo sysctl vm.vfs_cache_pressure=50
echo "Inode cache frequency value set..."

echo "Enabling permanent inode cache frequency value..."
echo "vm.vfs_cache_pressure = 50" >> /etc/sysctl.conf
echo "Enabled permanent inode cache frequency value..."

echo "Importing MariaDB gpg key..."
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8

echo "Adding the apt repository..."
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.4/ubuntu bionic main'
sudo apt update -y

echo "Installing MariaDB server..."
sudo apt-get install mariadb-server -y

echo "Installing MariaDB clients and client libraries"
sudo apt-get install mariadb-client libmariadb3 -y

echo "Start and enable MariaDB service..."
sudo systemctl enable --now mariadb

echo "Start MariaDB secure installation..."
sudo mysql_secure_installation

echo "$(mysql -V)"
