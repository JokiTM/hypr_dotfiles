#!/bin/env bash

MAKOCTL="/usr/bin/makoctl"
MAKOCONFIG="$HOME/.config/mako/config"
#MAKOCONFIG="/tmp/config"
COLORS="$HOME/.cache/wal/colors"

counter=0
while IFS= read -r line; do
    var="COLOR$((counter++))"
    declare "$var"="$line"
done < $COLORS
unset counter var
cat << EOF > $MAKOCONFIG

max-visible=10
layer=top
font=JetBrainsMono Nerd Font 11
background-color=#4c566add
border-radius=7
max-icon-size=48
default-timeout=10000
anchor=top-right
margin=20

background-color=$COLOR0
text-color=$COLOR5
border-color=$COLOR2

EOF
$MAKOCTL  reload
