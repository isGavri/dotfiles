#!/usr/bin/env sh
if [ "$(hyprctl activewindow -j | jq -r ".class")" = "Steam" || "$(hyprctl activewindow -j | jq -r ".class")" = "Spotify" ||  "$(hyprctl activewindow -j | jq -r ".class")" = "Discord"]; then
    xdotool getactivewindow windowunmap
else
    hyprctl dispatch killactive ""
fi
