#!/bin/bash

THRESHOLD=20
NOTIFIED=0

while true; do
  # Get battery percentage and charging status using upower
  BAT_PATH=$(upower -e | grep 'battery_')
  STATUS=$(upower -i $BAT_PATH | grep state | awk '{print $2}')
  PERCENTAGE=$(upower -i $BAT_PATH | grep percentage | awk '{print $2}' | tr -d '%')

  # If discharging and under threshold
  if [ "$STATUS" = "discharging" ] && [ "$PERCENTAGE" -le "$THRESHOLD" ] && [ "$NOTIFIED" -eq 0 ]; then
    notify-send -u critical "Battery Low" "Current charge is at ${PERCENTAGE}%. Please plug in the laptop."
    NOTIFIED=1 # Prevent spamming notifications every check
  elif [ "$STATUS" = "charging" ] || [ "$PERCENTAGE" -gt "$THRESHOLD" ]; then
    NOTIFIED=0 # Reset once plugged in or charged back up
  fi

  sleep 60
done
