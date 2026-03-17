#!/bin/sh

ls ~/Pictures/Wallpapers/tuff/* | shuf | while IFS= read -r wp
do
    echo "$wp" > /tmp/currwallpaper
    ~/.config/hypr/scripts/wal.sh "$wp"
    sleep 900
done
