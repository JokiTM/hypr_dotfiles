#!/bin/sh

#player=$(playerctl metadata | awk 'NR==1{ print $1 }')
status=$(playerctl status)

if [[ $status == "Paused" ]]; then
    playerctl -p strawberry play
else
    playerctl pause
fi
