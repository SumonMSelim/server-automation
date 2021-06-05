#!/usr/bin/env bash

./update.sh

echo "Installing postgres, postgresql..."
sudo apt install postgresql postgresql-contrib

echo "Resetting default password to 'postgres'"
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"

echo "Installation completed....."
