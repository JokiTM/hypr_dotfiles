#!/bin/sh

curr=$(pactl get-default-sink)
focusrite="alsa_output.usb-Focusrite_Scarlett_2i2_USB_Y8NEZ2A294B725-00.HiFi__Line__sink"
headphones="alsa_output.pci-0000_12_00.6.analog-stereo"

if [ "$curr" = $focusrite ]; then
 pactl set-default-sink $headphones
else
 pactl set-default-sink $focusrite
fi

