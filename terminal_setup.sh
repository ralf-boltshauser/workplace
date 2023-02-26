#!/bin/bash

# update 
sudo apt update && sudo apt install git -y

# clone git

git clone https://github.com/ralf-boltshauser/workplace.git
cd workplace

# installations 
sudo apt install vim bat xclip python3 thefuck zsh -y 

# change shell to zsh
chsh -s $(which zsh)

# setting up rc's
cat vim/.vimrc >> ~/.vimrc
cat bash/.bashrc >> ~/.bashrc
cat zsh/.zshrc >> ~/.zshrc
