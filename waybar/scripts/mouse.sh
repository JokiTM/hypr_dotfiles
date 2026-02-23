#!/bin/sh
razer-cli -d "Razer Basilisk Ultimate (Receiver)" --battery print | awk 'NR==2{ print $2}'
