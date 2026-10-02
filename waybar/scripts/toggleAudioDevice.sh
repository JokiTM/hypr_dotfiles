#!/bin/sh

curr=$(pactl get-default-sink)
focusrite="alsa_output.usb-Focusrite_Scarlett_2i2_USB_Y8NEZ2A294B725-00.HiFi__Line__sink"
headphones="alsa_output.usb-HP__Inc_HyperX_Cloud_Alpha_Wireless_00000001-00.analog-stereo"

if [ "$curr" = $focusrite ]; then
 pactl set-default-sink $headphones
else
 pactl set-default-sink $focusrite
fi

