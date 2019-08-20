#!/usr/bin/env bash

echo "Installing zsh..."
sudo apt install zsh -y

echo "Installing oh-my-zsh..."
curl -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh

echo "Preparing default zsh configuration..."
truncate --size=0 ~/.zshrc
cat ${PWD}/oh-my-zsh/zshrc.example >> ~/.zshrc

source ~/.zshrc
