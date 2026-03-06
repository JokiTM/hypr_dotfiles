#!/bin/sh

printf "$(cat /sys/class/hwmon/hwmon2/device/gpu_busy_percent)\n"
printf "$(sensors amdgpu-pci-0300 | grep edge | awk '{ print $2 }' | sed -r 's/\+//' | sed -r 's/\.0//')\r"
printf "$(echo "scale=2; $(cat /sys/class/hwmon/hwmon2/device/mem_info_vram_used) / 1024^3" | bc)/$(echo "scale=2; $(cat /sys/class/hwmon/hwmon2/device/mem_info_vram_total) / 1024^3" | bc)GiB used\n"

