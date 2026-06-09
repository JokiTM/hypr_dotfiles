#!/bin/sh

curr=$(pactl get-default-sink)
focusrite="alsa_output.usb-Focusrite_Scarlett_2i2_USB_Y8NEZ2A294B725-00.HiFi__Line__sink"
headphones="alsa_output.usb-C-Media_Electronics_Inc._Mpow-158_20171218-00.analog-stereo"

if [ "$curr" = $focusrite ]; then
 pactl set-default-sink $headphones
else
 pactl set-default-sink $focusrite
fi

