#!/bin/sh

#player=$(playerctl metadata | awk 'NR==1{ print $1 }')
status=$(playerctl status)

if [[ $status == "Paused" ]]; then
    playerctl -p mpd play
else
    playerctl -a pause
fi
