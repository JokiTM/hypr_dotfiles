#!/bin/sh
uuid=$(grep "^U" /etc/fstab | grep /home/mathis/sansa | awk '{ print $1 }' | sed -e 's/UUID=//' 
mountpoint=$(lsblk -o UUID,MOUNTPOINT | awk -v u="$uuid" '$1 == u {print $2}'))
if test -n "$mountpoint"  &&  mountpoint /home/mathis/sansa/ &> /dev/null; then
  #notify-send "Sansa" "Already mounted"
  echo
else
  error=$(mount /home/mathis/sansa/)
  if [ $? -ne 0 ]; then
    notify-send "sansa mount error" "$error"
    exit 1
  fi 
fi
