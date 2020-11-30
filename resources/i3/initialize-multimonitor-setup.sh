#!/usr/bin/env bash

# ugly workaround, but it works
sleep 0.01 && xrandr --output DP-1-3 --mode 2560x1440
sleep 0.02 && xrandr --output DP-1-3 --off
sleep 0.03 && xrandr --output DP-1-3 --mode 3840x2160 --pos 1920x0
sleep 0.04 && xrandr --output LVDS-1 --auto --pos 0x1200 --primary

sleep 0.05 && nitrogen --restore

echo "Monitors initialized"
