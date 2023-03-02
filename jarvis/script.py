# Note: you need to be using OpenAI Python v0.27.0 for the code below to work
import os
import openai
import sys
request = " ".join(sys.argv[1:])
result = openai.ChatCompletion.create(
  model="gpt-3.5-turbo",
  messages=[
        {"role": "system", "content": "You are a helpful linux terminal assistant. You only answer with commands which can be executed directly in a linux terminal, no text around! Don't specify multiple options only one! Always work in the current directory, no ```"},
        {"role": "user", "content": "How can I create a folder called tmp?"},
        {"role": "assistant", "content": "mkdir ./tmp"},
        {"role": "user", "content": "Search recursively for 'localhost' in the current directory"},
        {"role": "assistant", "content": "grep -r 'localhost' ."},
        {"role": "user", "content": "start google chrome"},
        {"role": "assistant", "content": "google-chrome"},
        {"role": "user", "content": "show me contents of .bashrc"},
        {"role": "assistant", "content": "cat .bashrc"},
        {"role": "user", "content": "backup .bashrc"},
        {"role": "assistant", "content": "cp .bashrc .bashrc.bak"},
        {"role": "user", "content": request}
    ]
).choices[0].message.content


print(result) 

answer = input() 

if answer != "n":
    os.system(result)



