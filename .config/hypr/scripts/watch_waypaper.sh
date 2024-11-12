#!/bin/bash

# Path to Waypaper's config.ini
WALLPAPER_CONFIG="/home/moni/.config/waypaper/config.ini"

# Log file for debugging
LOG_FILE="/home/moni/.config/waypaper/watch_and_update_colors.log"

# Function to update wallpaper and apply colors
update_colors() {
    # Extract the wallpaper path from config.ini
    WALLPAPER_PATH=$(sed -n 's/^wallpaper = //p' "$WALLPAPER_CONFIG" | xargs | sed "s|^~|$HOME|")

    # Ensure the wallpaper path isn't empty
    if [ -z "$WALLPAPER_PATH" ] || [ ! -f "$WALLPAPER_PATH" ]; then
        return
    fi

    # Run pywal with the wallpaper and apply the new colors to Kitty
    wal -i "$WALLPAPER_PATH" > /dev/null 2>&1
    kitty @ set-colors --all --configured ~/.cache/wal/colors-kitty.conf > /dev/null 2>&1
}

# Initial update
update_colors

# Monitor the config.ini for changes and update colors
while true; do
    inotifywait -e modify "$WALLPAPER_CONFIG"
    update_colors
done

