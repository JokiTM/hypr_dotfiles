#!/bin/sh

if [ $1 == "temp" ]; then
    sensors amdgpu-pci-0300 | grep edge | awk '{ print $2 }' | sed -r 's/\+//' | sed -r 's/\.0//'
elif [ $1 == "vram" ]; then
    echo "$(echo "scale=2; $(cat /sys/class/hwmon/hwmon2/device/mem_info_vram_used) / 1024^3" | bc | sed 's/^\./0./')/$(echo "scale=2; $(cat /sys/class/hwmon/hwmon2/device/mem_info_vram_total) / 1024^3" | bc)"
fi

