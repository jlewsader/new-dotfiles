#!/bin/sh

STATUS_FILE="${XDG_RUNTIME_DIR:-/tmp}/touchpad_toggle.status"

# Search for the input event device node for the touchpad
EVENT=$(grep -E -i "Surface.*Touchpad" -A 5 /proc/bus/input/devices | grep -o "event[0-9]*" | head -n 1)

if [ -z "$EVENT" ]; then
  notify-send -u critical "Touchpad" "Device not found"
  exit 1
fi

if [ ! -f "$STATUS_FILE" ] || [ "$(cat "$STATUS_FILE")" = "disabled" ]; then
  printf "enabled" >"$STATUS_FILE"
  sudo udevadm trigger --action=add --sysname-match="$EVENT"
  notify-send -u low "Touchpad" "Touchpad Enabled"
else
  printf "disabled" >"$STATUS_FILE"
  sudo udevadm trigger --action=remove --sysname-match="$EVENT"
  notify-send -u low "Touchpad" "Touchpad Disabled"
fi
