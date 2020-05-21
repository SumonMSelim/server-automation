#!/usr/bin/env bash

echo "Note: You will need to deploy a DNS TXT record to your domain."

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
