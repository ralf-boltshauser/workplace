#!/bin/bash

cd ~

i3-msg 'workspace 12' &&
i3-msg 'move workspace to output HDMI-1' &&

# chrome
google-chrome --new-window "https://askubuntu.com/questions/1207883/x11-forwarding-google-chrome-and-chromium-browsers-grey-out-other-apps-show-ok" &
sleep 0.5
google-chrome "https://www.digitalocean.com/community/tutorials/the-basics-of-using-the-sed-stream-editor-to-manipulate-text-in-linux" &
sleep 1.5
xdotool type 'ddd'

# terminals
xdotool key alt+Return && sleep 2 && xdotool type 'i3-msg split vertical' && xdotool key Return && xdotool type 'ls' && xdotool key Return && xdotool type 'cd prj' && xdotool key Return && xdotool type 'ls' && xdotool key Return && xdotool type 'ip addr' && xdotool key Return &&
xdotool key alt+Return && sleep 2 && xdotool type 'btop' && xdotool key Return &&
i3-msg focus up
