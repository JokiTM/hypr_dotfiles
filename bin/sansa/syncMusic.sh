#!/bin/bash

#cp -r /home/mathis/sansa/Music/.Playlists/ /home/mathis/Music/.Playlists/
~/.local/bin/sansa/mountsansa.sh || exit 1

remote=$(du -shm ~/sansa/Music | awk '{ print $1 }')
local=$(du -shm ~/Music | awk '{ print $1 }')
let "trans = $local - $remote"
diff=$(echo $trans | awk '{for (i = 1; i <= NF; i++) $i = ($i/(1000)); print }')
notify-send "sansa" "start syncing ${diff}G"
rsync -rthc --fsync --modify-window=1 --info=progress2 --delete --exclude='.Playlists/' --exclude='.data/' /home/mathis/Music/ /home/mathis/sansa/Music/
after=$(du -shm  ~/sansa/Music | awk '{ print $1 }')
let "trans = $after - $remote"
diff=$(echo $trans | awk '{for (i = 1; i <= NF; i++) $i = ($i/(1000)); print }')
echo "Synchronizing cached writes..."
sync -f /home/mathis/sansa/ &
pid=$!
watch -n.1 getCachedWrites &
pidC=$!
wait "$pid"
kill -9 $pidC
notify-send "sansa" "finished syncing ${diff}G"
