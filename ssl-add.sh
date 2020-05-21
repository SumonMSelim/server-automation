#!/usr/bin/env bash

echo "Enter your domain names (domain.com,www.domain.com)..."
read domains

echo "Enter your email address..."
read email

echo "Installing SSL for ${domains}..."
sudo certbot certonly \
    --nginx \
    --email ${email} \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --agree-tos \
    -d ${domains}
