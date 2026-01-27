#!/bin/bash

SOURCE_DIR="input"
DEST_DIR="output"

mkdir -p "$DEST_DIR"

echo "--- Début de la conversion pour Rocknix MVP (720x480) ---"

for f in "$SOURCE_DIR"/*.{mp4,mkv,avi,mov}; do
    [ -e "$f" ] || continue

    filename=$(basename "$f")
    echo "Traitement de : $filename..."

    ffmpeg -i "$f" \
        -vf "scale=720:480:force_original_aspect_ratio=decrease,pad=720:480:(ow-iw)/2:(oh-ih)/2,setsar=1" \
        -c:v libx264 \
        -profile:v main \
        -level 4.0 \
        -pix_fmt yuv420p \
        -aspect 3:2 \
        -c:a aac \
        -b:a 128k \
        -y "$DEST_DIR/${filename%.*}.mp4"
done

echo "--- Terminé ! Output dir : $DEST_DIR ---"