#!/bin/bash
echo "updating dependencies & packages..."
sudo apt-get update && sudo apt-get dist-upgrade

echo "adding swap memory..."
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "swap memory added..."

echo "enabling permanent swap file..."
sudo nano /etc/fstab
# have to append: /swapfile   none    swap    sw    0   0
echo "enabled permanent swap file..."

echo "setting swappiness value..."
sudo sysctl vm.swappiness=10
echo "swappiness value set..."

echo "enabling permanent swappiness value..."
sudo nano /etc/sysctl.conf
# have to append: vm.swappiness = 10
echo "enabled permanent swappiness value..."

echo "setting inode cache frequency value..."
sudo sysctl vm.vfs_cache_pressure=50
echo "inode cache frequency value set..."

echo "enabling permanent inode cache frequency value..."
sudo nano /etc/sysctl.conf
# have to append: vm.vfs_cache_pressure = 50
echo "enabled permanent inode cache frequency value..."

echo "setting up mariadb repo..."
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://mirror.jmu.edu/pub/mariadb/repo/10.2/ubuntu xenial main'
sudo apt update -y

echo "installing mariadb..."
sudo apt install -y mariadb-server

echo "start and enable mariadb service..."
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

echo "start mariadb secure installation..."
sudo /usr/bin/mysql_secure_installation
