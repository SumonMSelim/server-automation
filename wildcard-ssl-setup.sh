#!/usr/bin/env bash

echo "Enter your domain names (domain.com)..."
read domain

echo "Enter your email address..."
read email

echo "Installing SSL for ${domain}..."
sudo certbot certonly \
    --manual \
    --preferred-challenges=dns \
    --email ${email} \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --agree-tos \
    -d "*.${domain}"
