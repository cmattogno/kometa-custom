#!/bin/bash
# Move episode thumbnails from Season subfolders to show root
# for Kometa compatibility

find /path/to/Kometa_assets/TV -type d -name "Season*" | while read season_dir; do
    show_dir=$(dirname "$season_dir")
    for ep_file in "$season_dir"/S??E??.jpg; do
        if [ -f "$ep_file" ]; then
            mv "$ep_file" "$show_dir/"
            echo "Moved: $(basename "$ep_file") → $(basename "$show_dir")"
        fi
    done
    # Remove empty Season folders
    rmdir "$season_dir" 2>/dev/null
done
