#!/bin/sh

ip link show CachyDesktop >/dev/null 2>&1 

if [ $? == "0" ]; then
    echo "󰒃"
else 
    echo "󰦞"
fi
