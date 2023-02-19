#!/bin/bash
# installing tools
sudo apt update
sudo apt remove neovim -y
sudo apt install i3 btop xdotool rofi polybar vim docker.io git  maim xclip -y

## vs code
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code -y

## google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f -y
rm google-chrome-stable_current_amd64.deb

sudo apt update -y
sudo apt upgrade -y
# setting up environment
mkdir -p ~/.config
cp -R i3 ~/.config
cp -R polybar ~/.config

echo vim/.vimrc >> ~/.vimrc
echo bash/.bashrc >> ~/.bashrc
i3-msg restart
