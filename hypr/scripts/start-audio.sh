#!/bin/sh

pipewire &
sleep .1
pipewire-pulse & 
sleep .1
wireplumber & 

mpd &
sleep 1 
#mpd-mpris -host "/home/mathis/.config/mpd/socket" -network unix &

/home/mathis/.local/share/cargo/bin/rmpcd > ~/RMPCD_LOG 2>&1
