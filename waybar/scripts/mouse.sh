#!/bin/sh
razer-cli -d "Razer Basilisk Ultimate (Receiver)" --battery print | awk 'NR==2{ print $2}'
razer-cli -d "Razer Basilisk Ultimate (Wired)" --battery print | awk 'NR==2{ print $2}'
printf " %s%%\n" "$("$HOME/.local/bin/alphabat" 2>&1)"
