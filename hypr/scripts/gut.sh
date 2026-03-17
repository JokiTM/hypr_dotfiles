#!/bin/sh

tmplist="/tmp/walllist"
tmppic="/tmp/wallpic"
log="/tmp/walllog"

while : 
do
    if [[ ! -e $tmplist || ! -e $tmppic ]]; then
        echo "Tmplist or tmppic missing. Initializing." >> $log
        find ~/Pictures/Wallpapers -type f -name "*.jpg" -o -name "*png" -o -name "*.webp" -o -name "*.jpeg" -o -name "*.jpe" | shuf > $tmplist
        #ls ~/Pictures/Wallpapers/tuff/* ~/Pictures/Wallpapers/newabm/* | awk NF | shuf > $tmplist
        head -n 1 $tmplist > $tmppic
    fi


    cat $tmplist | while IFS= read -r wp
do
#    if [[ $(<"$tmppic") != "$wp" ]]; then
#        echo "$(cat $tmppic) doesnt match current wp. Skipping" >> $log
#        continue
#    fi
    echo "$wp" > $tmppic
    echo "$(date +"%Y-%m-%d_%H-%M-%S"): Setting wall to $wp" >> $log
    ~/.config/hypr/scripts/wal.sh "$wp"
    sleep 900
done

echo "$(date +"%Y-%m-%d_%H-%M-%S"): Finished itertating. Removing list" >> $log
rm $tmplist $tmppic
done
