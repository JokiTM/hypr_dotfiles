#!/bin/bash

hyprlock -q &
sleep .5 
systemctl hibernate
