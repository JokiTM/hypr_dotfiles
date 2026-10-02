#!/bin/sh

ip link show vpn >/dev/null 2>&1 

if [ $? == "0" ]; then
    echo "󰒃"
else 
    echo "󰦞"
fi
