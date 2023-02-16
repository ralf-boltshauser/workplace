#!/bin/bash

i3-msg 'workspace 1' &&
sleep 1
xdotool key alt+Return &&
google-chrome --new-window "https://notion.so" &

sleep 2

i3-msg 'workspace 2' &&
google-chrome --new-window &

sleep 2
i3-msg 'workspace 3' &&
sleep 2
xdotool key alt+Return &&
xdotool key alt+Return &&
i3-msg focus left
