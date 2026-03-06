#!/bin/sh

#playerctl metadata | grep artUrl | awk '{ print $3 }'

#status=$(playerctl status)

#if [[ $player == "strawberry" ]]; then
#    playerctl metadata | grep artUrl | awk '{ print $3 }' |  sed -r 's/file:\/\///'
#elif [[ $player == "mpv" ]]; then
#    echo "/home/mathis/.config/waybar/scripts/logos/mpv.png"
#elif [[ $player == "vlc" ]]; then
#    echo "/home/mathis/.config/waybar/scripts/logos/vlc.svg"
#else
#    echo "/home/mathis/.config/waybar/scripts/firefox.svg"
#fi

file=$(playerctl metadata | grep artUrl | awk '{ print $3 }' |  sed -r 's/file:\/\///')

if [[ $file ]]; then
    if [[ $file == *"base64"* ]];then
        tmp=$(mktemp)
        echo $file | sed 's|^data:image/jpeg;base64,||' | base64 -d > $tmp.png
        echo $tmp.png
    else
        printf $file
        printf "\ngeilescover"
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

printf "\ngeilescover"



