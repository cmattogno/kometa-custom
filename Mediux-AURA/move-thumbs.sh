#!/bin/bash
# Rename AURA episode thumbnails to Kometa's expected format
# Converts: "Show Name - S01E01 - Title-thumb.jpg"
# To: "S01E01.jpg" inside the show's Season XX folder

find /Media_4TB/DOCKER/Kometa_assets/TV -name "*-thumb.jpg" | while read f; do
  dir=$(dirname "$f")
  se=$(echo "$f" | grep -oP 'S\d{2}E\d{2}')
  if [ -n "$se" ]; then
    mv "$f" "$dir/${se}.jpg"
    echo "Renamed: $(basename "$f") → ${se}.jpg"
  fi
done
