#!/bin/bash

TARGET_DIR="$HOME/DropToPhone"

# Ensure the folder exists
mkdir -p "$TARGET_DIR"

# Watch the folder for newly closed/written files
inotifywait -m -e close_write --format '%w%f' "$TARGET_DIR" | while read -r file; do
  # Skip hidden files or temp writes
  [[ "$(basename "$file")" =~ ^\. ]] && continue

  # Run your drop script
  ~/.local/bin/kde-drop.sh "$file"

  # Optional: Delete the file from the drop folder after sending,
  # comment out the line below if you want to keep a local copy.
  rm -f "$file"
done
