#!/usr/bin/env bash

sh ./update.sh

echo "Installing pm2 globally"
sudo npm i -g pm2@latest

pm2 status
