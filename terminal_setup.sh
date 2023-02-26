#!/bin/bash

# update 
apt update && apt install git -y

# clone git

git clone https://github.com/ralf-boltshauser/workplace.git
cd workplace

# installations 
apt install vim bat btop xclip -y 

# setting up rc's
cat vim/.vimrc >> ~/.vimrc
cat bash/.bashrc >> ~/.bashrc

