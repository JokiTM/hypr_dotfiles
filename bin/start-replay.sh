#!/usr/bin/env bash

$REPLAY_SECONDS=300

pidof -q gpu-screen-recorder && exit 0
#gpu-screen-recorder -w screen -f 60 -a default_output -c mkv -bm cbr -q 40000 -r 30 -o ~/Videos
gpu-screen-recorder -w DP-1 -c mkv -ac opus -cursor yes -cr limited -pixfmt yuv420 -fm vfr -k auto -encoder gpu -f 180 -r $REPLAY_SECONDS -v no -fallback-cpu-encoding yes -o /home/mathis/Videos -replay-storage ram -bm cbr -q 40000 -a "device:default_output|device:default_input" -restore-portal-session yes -ro /home/mathis/Videos
