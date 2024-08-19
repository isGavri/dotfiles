#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/"

killall waybar &
notify-send "Restarting Waybar" "New config applied\n$CONFIG_FILES"
hyprctl dispatch exec waybar
