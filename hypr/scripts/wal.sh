#!/bin/bash

wal -i "$1" > /dev/null
~/.config/mako/wal.sh &
~/.config/zathura/genzathurarc &
touch ~/.config/rmpc/pywal16.ron &
kill -SIGUSR2 $(pgrep btop)
notify-send "Wallpaper" "setting wall" -i "$1"
