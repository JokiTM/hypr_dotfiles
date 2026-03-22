#!/bin/sh 

notify-send "Wallpaper" "setting wall to $1" -i "$1"
#hyprctl hyprpaper wallpaper ",$1"
wal -i "$1" > /dev/null
#kill -SIGUSR2 waybar
~/.config/mako/wal.sh &
~/.config/zathura/genzathurarc &
touch ~/.config/rmpc/pywal16.ron &
razer-cli -a &
