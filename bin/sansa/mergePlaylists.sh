#!/bin/sh

paths=(~/.config/mpd/playlists ~/sansa/Playlists)
tmpdir=$(mktemp -d /tmp/playlistMergeXXX)
playlists=


for path in "${paths[@]}"; do
    for file in "$path"/*; do
        base=$(basename "$file" .m3u )
        trunc=$(basename "$base" .m3u8)
        cat "$file" | sed "s/\.\.\/Music\///" | sed "s/\/<microSD.>\/Music\///" >> $tmpdir/$trunc
        playlists+=("$trunc")
    done
done

cd ~/Music/

for file in "$tmpdir"/*; do
    sort -u "$file" -o "$file"
    while read -r line; do
        if [[ ! -e "$line" ]]; then
            echo "$(basename "$file"): Song \"$line\" not found"
        fi
    done < "$file"
done

for file in "$tmpdir"/*; do
    base=$(basename "$file")
    cp "$file" "${paths[0]}"/"$base".m3u
    cat "$file" | sed -e "s/^/\.\.\/Music\//" > "${paths[1]}"/"$base".m3u
done

rm -r "$tmpdir"
