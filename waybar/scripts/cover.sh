#!/bin/sh

stat=$(playerctl status 2>&1)

if [[ "$stat" = "No players found" ]]; then
    echo " "
    exit 1
elif [[ $stat = "Paused" ]]; then
    printf "/tmp/rmpcd-cover-art\n/tmp/rmpcd-cover-art"
    exit 0
elif [[ $stat = "Stopped" ]]; then
    printf "         \n"
    exit 0
fi


file=$(playerctl metadata | grep artUrl | awk '{ print $3 }' |  sed -r 's/file:\/\///')

if [[ $file ]]; then
    if [[ $file == *"base64"* ]];then
        tmp=$(mktemp)
        echo $file | sed 's|^data:image/jpeg;base64,||' | base64 -d > $tmp.png
        echo $tmp.png
    else
        printf $file
        printf "\n$file"
    fi
    exit 0
fi


player=$(playerctl metadata | awk 'NR==1{ print $1 }')
case $player in
    "mpv")
        printf "/home/mathis/.config/waybar/scripts/logos/mpv.png"
        ;;
    "vlc")
        printf "/home/mathis/.config/waybar/scripts/logos/vlc.svg"
        ;;
    *)
        printf "/home/mathis/.config/waybar/scripts/logos/firefox.svg"
esac




