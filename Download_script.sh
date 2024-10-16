#!/bin/bash

# Array of multiple magnet links
MAGNET_LINKS=(
    "magnet:?xt=urn:btih:<torrent-hash-1>&dn=movie-1"
    "magnet:?xt=urn:btih:<torrent-hash-2>&dn=ebook-2"
    "magnet:?xt=urn:btih:<torrent-hash-3>&dn=course-3"
)

# Directory where the files will be saved
TARGET_DIR="$HOME/Downloads/Torrents"

# Creating target directory if it doesn't exist
mkdir -p $TARGET_DIR

# Loop through all magnet links
for MAGNET_LINK in "${MAGNET_LINKS[@]}"
do
    echo "Starting torrent download for $MAGNET_LINK..."
    aria2c --dir=$TARGET_DIR --seed-time=0 "$MAGNET_LINK"
    
    # Check if the download was successful
    if [ $? -eq 0 ]; then
        echo "Download complete! Files saved in $TARGET_DIR"
    else
        echo "Torrent download failed for $MAGNET_LINK!"
    fi
done
