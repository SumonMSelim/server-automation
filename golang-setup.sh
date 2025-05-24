#!/usr/bin/env bash

set -e

echo "Updating system..."
sh ./update.sh

echo ""
echo "Which version of Go would you like to install?"
go_versions=( 1.22.0 1.21.7 1.20.14 latest )

select go_version in "${go_versions[@]}"; do
    if [[ $go_version == "latest" ]]; then
        go_url=$(curl -s https://go.dev/dl/ | grep -oP 'https://dl.google.com/go/go[0-9.]+.linux-amd64.tar.gz' | head -n 1)
    else
        go_url="https://dl.google.com/go/go${go_version}.linux-amd64.tar.gz"
    fi
    echo "Selected version: $go_version"
    break
done

echo ""
echo "Downloading Go from $go_url ..."
curl -LO "$go_url"

tar_file=$(basename "$go_url")
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "$tar_file"
rm "$tar_file"

echo ""
echo "Verifying installation..."
go version
which go
echo $PATH

echo "Golang has been installed and configured."