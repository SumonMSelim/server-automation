#!/usr/bin/env bash

echo "Installing zsh..."
sudo apt install zsh -y

echo "Installing oh-my-zsh..."
curl -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh --unattended

echo "Preparing default zsh configuration..."
truncate --size=0 ${HOME}/.zshrc
cat ${PWD}/oh-my-zsh/zshrc.example >> ${HOME}/.zshrc
rm -f install.sh

echo "Set default shell to zsh"
chsh -s /bin/zsh

echo "Run zsh"
zsh -l
