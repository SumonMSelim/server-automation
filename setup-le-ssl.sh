#!/bin/bash
echo "Enter your project directory path (/var/www/domain/public):"
read path

echo "Enter your domain names (domain.com,www.domain.com):"
read domains

echo "Installing SSL for ${domains}..."
sudo certbot certonly --webroot --webroot-path=${path} -d ${domains}
