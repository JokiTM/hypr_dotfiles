#!/bin/sh

opac=$(hyprctl getoption decoration:blur:passes | awk 'NR==1{print $2}')
if [ -z $1 ];then
    notify-send "Usage: ./opacity [inc|dec]"
    echo "Usage: ./opacity [inc|dec]"
elif [ "$1" == "inc" ]; then
    ((opac++))
elif [ "$1" == "dec" ]; then
    ((opac--))
else
    notify-send "Usage: ./opacity [inc|dec]"
    echo "Usage: ./opacity [inc|dec]"
fi


if [ $opac == 0 ] || [ $opac -lt 0 ]; then
    hyprctl keyword decoration:blur:enabled false
    hyprctl keyword decoration:blur:passes 0
    exit 0
fi
hyprctl keyword decoration:blur:enabled true
notify-send -p -r $(cat /tmp/notif-opac) "Setting opacity to $opac" > /tmp/notif-opac
hyprctl keyword decoration:blur:passes $opac
