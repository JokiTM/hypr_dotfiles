#!/usr/bin/env bash

DOTDIR=~/.local/share/dots
CONFDIR=~/.config
declare -a configs=("hypr" "mako" "wal" "btop" "fuzzel" "yazi" "nvim" "waybar" "zathura" "zsh")

for i in "${configs[@]}"
do
    ln -s "$DOTDIR/$i" "$CONFDIR"
done

