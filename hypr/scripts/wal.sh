#!/bin/bash

notify-send "Wallpaper" "setting wall to $1" -i "$1"
#hyprctl hyprpaper wallpaper ",$1"
wal -i "$1" > /dev/null
#kill -SIGUSR2 waybar
~/.config/mako/wal.sh &
~/.config/zathura/genzathurarc &
nvim --remote-send ":source ~/.config/nvim/init.lua<CR>" --server /run/user/1000/nvim.* &
touch ~/.config/rmpc/pywal16.ron &
kill -SIGUSR2 $(pgrep btop)
razer-cli -a
razer-cli -d 'Razer Basilisk Ultimate (Receiver)' -b 10
hyprctl reload &
