#!/bin/bash

sudo apt install i3 rofi polybar
mkdir -p ~/.config
cp -R i3 ~/.config
cp -R polybar ~/.config

i3-msg restart
