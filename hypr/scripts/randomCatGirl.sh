#!/bin/sh

while :
do
    ids=$(curl -s "https://nekos.moe/api/v1/random/image?count=100" | jq -r '.images[].id')

while IFS=' ' read -r id
    do
        curl -s -o /tmp/catgirl https://nekos.moe/image/$id
        w=$(magick identify -format "%w" /tmp/catgirl)
        h=$(magick identify -format "%h" /tmp/catgirl)
        echo "Downloaded image $w x $h"
        if [ $w -gt 1919 ] && [ $h -gt 1079 ]; then
            ~/.config/hypr/scripts/wal.sh /tmp/catgirl
            sleep 500
        fi
    done <<< $ids
done
