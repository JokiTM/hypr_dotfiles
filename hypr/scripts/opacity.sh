#!/bin/sh

opac=$(hyprctl getoption decoration:blur:size | awk 'NR==1{print $2}')
if [ -z $1 ];then
    notify-send "Usage: ./opacity [inc|dec]"
    echo "Usage: ./opacity [inc|dec]"
elif [ "$1" == "inc" ]; then
    ((opac++))
    notify-send "Setting opacity to $opac"
    hyprctl keyword decoration:blur:size $opac
elif [ "$1" == "dec" ]; then
    ((opac--))
    notify-send "Setting opacity to $opac"
    hyprctl keyword decoration:blur:size $(( $(hyprctl getoption decoration:blur:size | awk 'NR==1{print $2}') - 1 ))
else
    notify-send "Usage: ./opacity [inc|dec]"
    echo "Usage: ./opacity [inc|dec]"
fi
