#!/bin/bash

pid=$(pidof hypridle)

if [[ $pid ]]; then
    kill $pid && notify-send "Hypridle" "Hypridle has been turned OFF."
else
    hypridle &
    pidof hypridle && notify-send "Hypridle" "Hypridle has been turned ON."
fi
