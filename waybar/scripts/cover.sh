#!/bin/sh

#playerctl metadata | grep artUrl | awk '{ print $3 }'

player=$(playerctl metadata | awk 'NR==1{ print $1 }')
status=$(playerctl status)

if [[ $player == "strawberry" ]]; then
    playerctl metadata | grep artUrl | awk '{ print $3 }' |  sed -r 's/file:\/\///'
elif [[ $player == "mpv" ]]; then
    echo "/home/mathis/.config/waybar/scripts/mpv.png"
else
    echo "/home/mathis/.config/waybar/scripts/firefox.svg"
fi
