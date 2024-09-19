#!/usr/bin/bash

# -o output
# -i input
# m mute
# d increase
# i decrease

# Icon directory
icodir="/home/notsy/dotfiles/home/.config/dunst/icons/vol/"

function action_out() {
  # 47
  case "${1}" in
  i)
    volume="$(wpctl get-volume 47 | cut -c 9-)"
    if [[ "$volume" != "1.00" ]]; then
      wpctl set-volume 47 0.05+
      volume="$(wpctl get-volume 47 | cut -c 9-)"
      topercent="$(echo $volume | cut -c 3-)"
    else
      topercent="100"
    fi
    echo $topercent
    notify-send -a "Volume" -r 91190 -t 1000 -i "${icondir}/vol-${topercent}.svg" "Output device" "${topercent}%"
    ;;
  d)
    volume="$(wpctl get-volume 47 | cut -c 9-)"
    if [[ "$volume" != "0.00" ]]; then
      wpctl set-volume 47 0.05-
      volume="$(wpctl get-volume 47 | cut -c 9-)"
      topercent="$(echo $volume | cut -c 3-)"
    else
      topercent="0"
    fi
    echo $topercent
    notify-send -a "Volume" -r 91190 -t 1000 -i "${icondir}/vol-${topercent}.svg" "Output device" "${topercent}%"
    ;;
  m)
    wpctl set-mute 47 toggle
    volume="$(wpctl get-volume 47 | cut -c 14-)"
    if [[ "$volume" == "[MUTED]" ]]; then
      topercent="Muted"
    else
      topercent="Unmuted"
    fi
    notify-send -a "Volume" -r 91190 -t 1000 -i "${icondir}/muted-speaker.svg" "Output device" "${topercent}"
    ;;
  *)
    cat <<"EOF"
    ./volume.sh [device] <actions>
    ...valid device are...
        -i   -- input decive
        -o   -- output device
    ...valid actions are...
        i   -- increase volume [+5]
        d   -- decrease volume [-5]
        m   -- mute [x]
EOF
    exit 1

    ;;
  esac
}

function action_in() {
  # 48

  case "${1}" in
  i)
    volume="$(wpctl get-volume 48)"
    if [[ "$volume" != "1.00" ]]; then
      topercent="$(echo $volume | cut -c 3-)"
      wpctl set-volume 48 0.05+
    else
      topercent="100"
    fi
    notify-send -a "Volume" -r 91190 -t 1000 -i "${icondir}/vol-${topercent}.svg" "Input device"
    ;;
  d)
    volume="$(wpctl get-volume 48)"
    if [[ "$volume" != "1.00" ]]; then
      topercent="$(echo $volume | cut -c 3-)"
      wpctl set-volume 48 0.05+
    else
      topercent="100"
    fi
    notify-send -a "Volume" -r 91190 -t 1000 -i "${icondir}/vol-${topercent}.svg" "Input device" "${topercent}%"
    ;;
  m)
    wpctl set-mute 48 toggle
    volume="$(wpctl get-volume 48)"
    if [[ "$volume" != "[MUTED]" ]]; then
      topercent="Muted"
    else
      topercent="Unmuted"
    fi
    notify-send -a "Volume" -r 91190 -t 1000 -i "${icondir}/muted-mic.svg" "Input device" "${topercent}"
    ;;
  *)
    cat <<"EOF"
    ./volume.sh [device] <actions>
    ...valid device are...
        -i   -- input decive
        -o   -- output device
    ...valid actions are...
        i   -- increase volume [+5]
        d   -- decrease volume [-5]
        m   -- mute [x]
EOF
    exit 1

    ;;
  esac
}

# Get args
while getopts "o:i:" flag; do
  case $flag in

  o)
    action_out $OPTARG
    ;;
  i)
    action_in $OPTARG
    ;;
  *)
    cat <<"EOF"
    ./volume.sh [device] <actions>
    ...valid device are...
        -i   -- input decive
        -o   -- output device
    ...valid actions are...
        i   -- increase volume [+5]
        d   -- decrease volume [-5]
        m   -- mute [x]
EOF
    exit 1
    ;;
  esac
done
