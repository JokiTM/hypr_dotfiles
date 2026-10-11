#!/bin/bash

file=/home/mathis/sansaInternal/.scrobbler.log
mkdir -p $(dirname $file)
mount $(dirname $file)
mkdir -p "/home/mathis/.local/share/scrobbler"


if [ ! -f $file ]; then
  notify-send "Sansa" ".scrobbler.log not found"
  exit 2
fi

tracks=$(cat $file | wc -l)
sum=$(($tracks-4))
notify-send "Sansa" "Start scrobbling $sum tracks"

status=~/SCROBBLING
touch $status

now=$( date '+%F_%H:%M:%S' )

##brauchen den output für das system tray
/home/mathis/Projects/pyscrobbler/scrobbler.py $file -l ~/.local/share/scrobbler/meta.log || exit 1
mv $file "/home/mathis/.local/share/scrobbler/${now}.log"
#notify-send "Sansa" "Finished scrobbling"
/usr/bin/rm $status

umount $(dirname $file)
rmdir $(dirname $file)
