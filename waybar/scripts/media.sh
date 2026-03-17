#!/bin/sh

#player=$(playerctl metadata | awk 'NR==1{ print $1 }')
status=$(playerctl status)

if [[ $status == "Paused" ]]; then
    notify-send "Playing"
    playerctl -p mpd play
else
    notify-send "Pausing"
    playerctl -a pause
fi
