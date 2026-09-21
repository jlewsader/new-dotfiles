#!/bin/bash

# Prompt user for input via Wofi
input=$(echo -e "Type math expression here..." | wofi --dmenu --prompt "Calc" -p "Expression:")

# Exit if user cancelled or left placeholder
[ -z "$input" ] && exit 0
[[ "$input" == "Type math expression here..." ]] && exit 0

# Clean the input: remove newlines, spaces, and any accidental trailing equals signs
clean_input=$(echo "$input" | tr -d '\n=' | xargs)

# Evaluate the expression using bc safely
result=$(echo "scale=4; $clean_input" | bc 2>&1)

if [ $? -eq 0 ] && [ -n "$result" ]; then
  # Success: Copy to clipboard and show notification
  echo -n "$result" | wl-copy
  notify-send "Calculator" "$clean_input = $result (Copied)"
else
  # Failure: Let the user know the expression was invalid
  notify-send "Calculator Error" "Could not evaluate: $input"
fi
