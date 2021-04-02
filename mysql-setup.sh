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

echo "Installing MySQL 8 server..."
sudo apt-get install mysql-server -y

echo "Start MariaDB secure installation..."
sudo mysql_secure_installation

echo "$(mysql -V)"
