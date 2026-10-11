#!/bin/bash
sleep .01
hyprctl dispatch togglefloating >/dev/null
hyprctl dispatch resizeactive exact 60% 60%  >/dev/null
hyprctl dispatch centerwindow 1 >/dev/null

du -sm ~/Music | awk '{ print $1 }' > /tmp/local_size &
pid_local=$!

du -sm ~/sansa/Music | awk '{ print $1 }' > /tmp/remote_size &
pid_remote=$!

#rsync -rthv --modify-window=1 --exclude='.Playlists/' --delete /home/mathis/Music/ /home/mathis/sansa/Music/ --dry-run | less
rsync -rthv  --modify-window=1  --delete --exclude='.Playlists/' --exclude='.data/' /home/mathis/Music/ /home/mathis/sansa/Music/ --dry-run | less

wait $pid_local
wait $pid_remote

local=$(cat /tmp/local_size)
remote=$(cat /tmp/remote_size)

trans=$(( local - remote ))
diff=$(awk "BEGIN { printf \"%.2f\", $trans / 1000 }")
sync=$(echo -e "Yes\nNo" | fuzzel -d --placeholder "Sync ${diff}GB?")
if [ "$sync" = "Yes" ]; then
  exit 67
  #nohup /home/mathis/.local/bin/sansa/syncMusic.sh &
fi
hyprctl dispatch killactive
