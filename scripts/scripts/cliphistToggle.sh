#!/bin/bash

pid=$(pidof wl-paste)

if [[ $pid ]]; then
    kill $pid && notify-send "Cliphist" "Cliphist has been turned OFF."
else
    wl-paste --type text --watch cliphist store &
    wl-paste --type image --watch cliphist store &
    pidof wl-paste && notify-send "Cliphist" "Cliphist has been turned ON."
fi
