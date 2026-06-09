#!/bin/env bash

killall -USR1 wl-screenrec
if [[ $? == 0 ]]; then
    notify-send "Saving Screenrecording!" 
else
    notify-send "Screenrec" "Something wrent wrong... No process found"
fi

sleep 5
killall wl-screenrec 

sleep 1
NOW=$(date +"%Y-%m-%d_%H-%M-%S")
mv /tmp/screenrec.mkv "$HOME/Videos/screenrec/$NOW.mkv"


sleep 5
wl-screenrec --audio --audio-device wl-screenrec-input.monitor -f /tmp/screenrec.mkv -o DP-3 --history 300
