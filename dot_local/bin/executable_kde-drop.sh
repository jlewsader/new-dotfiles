#!/bin/bash

# Find the first paired and available device ID via kdeconnect-cli
device_id=$(kdeconnect-cli --list-available --id-only 2>/dev/null | head -n 1)

if [ -z "$device_id" ]; then
  notify-send "KDE Connect" "No phone connected to receive files!"
  exit 1
fi

# Loop through all passed files and push them to the phone
for file in "$@"; do
  if [ -f "$file" ]; then
    kdeconnect-cli -d "$device_id" --share "$file"
    notify-send "KDE Connect" "Sent: $(basename "$file")"
  fi
done
