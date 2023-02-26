#!/bin/bash

# update 
sudo apt update && sudo apt install git -y

# clone git

git clone https://github.com/ralf-boltshauser/workplace.git
cd workplace

# installations 
sudo apt install vim bat xclip python3 python3-dev python3-pip python3-setuptools -y 
pip3 install thefuck --user

# setting up rc's
cat vim/.vimrc >> ~/.vimrc
cat bash/.bashrc >> ~/.bashrc

