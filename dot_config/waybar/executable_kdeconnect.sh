#!/bin/bash

# Grab the first paired and reachable device ID from kdeconnect-cli
device_info=$(kdeconnect-cli --list-available --id-only 2>/dev/null | head -n 1)

if [ -z "$device_info" ]; then
  # Fallback: check if any device is at least paired even if currently out of reach
  device_info=$(kdeconnect-cli -l --id-only 2>/dev/null | head -n 1)
  if [ -z "$device_info" ]; then
    echo '{"text": "󰒖", "tooltip": "No KDE Connect devices paired"}'
    exit 0
  else
    echo '{"text": "󰼣", "tooltip": "Phone Disconnected"}'
    exit 0
  fi
fi

# Get battery percentage for the found device ID
battery=$(kdeconnect-cli -d "$device_info" --battery 2>/dev/null | grep -o '[0-9]*%')

if [ -z "$battery" ]; then
  echo "{\"text\": \"󰄜\", \"tooltip\": \"Phone Connected (Battery unknown)\"}"
else
  echo "{\"text\": \"󰄜 ${battery}\", \"tooltip\": \"Phone Connected (${battery})\"}"
fi
