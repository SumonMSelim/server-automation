#!/usr/bin/env bash

sh ./update.sh

echo "Installing lts/fermium (node and npm) using nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.nvm/nvm.sh

nvm install lts/fermium


echo "Installing yarn..."
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sh ./update.sh
sudo apt install -y --no-install-recommends yarn

echo "Installing pm2..."
npm install pm2 -g

echo 'Installation completed.....'

echo "Node version - $(node -v)"
echo "Npm version - $(npm -v)"
echo "Yarn version - $(yarn -v)"
