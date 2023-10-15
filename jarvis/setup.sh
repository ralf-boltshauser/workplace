#!/bin/bash

python3 -m pip install openai

sudo cp ./executable/jarvis /usr/local/bin/jarvis

sudo chmod +x /usr/local/bin/jarvis

# echo "export OPENAI_API_KEY=" >> ~/.bashrc
# vim ~/.bashrc
