#!/bin/bash

SOURCE_DIR="input"

convert_for_device() {
    local DEVICE=$1
    case "$DEVICE" in
        rg34xxsp) local W=720 H=480 ASPECT="3:2"  PROFILE="main"     LEVEL="4.0" ;;
        rgds)     local W=640 H=480 ASPECT="4:3"  PROFILE="main"     LEVEL="4.0" ;;
        psp)      local W=480 H=272 ASPECT="16:9" PROFILE="baseline" LEVEL="3.0" ;;
    esac

    local DEST_DIR="output/$DEVICE"
    mkdir -p "$DEST_DIR"

    echo "--- Conversion pour $DEVICE (${W}x${H}) ---"

    for f in "$SOURCE_DIR"/*.{mp4,mkv,avi,mov}; do
        [ -e "$f" ] || continue

        filename=$(basename "$f")
        echo "Traitement de : $filename..."

        ffmpeg -i "$f" \
            -vf "scale=$W:$H:force_original_aspect_ratio=decrease,pad=$W:$H:(ow-iw)/2:(oh-ih)/2,setsar=1" \
            -c:v libx264 \
            -profile:v $PROFILE \
            -level $LEVEL \
            -pix_fmt yuv420p \
            -aspect $ASPECT \
            -c:a aac \
            -b:a 128k \
            -y "$DEST_DIR/${filename%.*}.mp4"
    done

    echo "--- Terminé ! Output dir : $DEST_DIR ---"
}

case "${1:-all}" in
    rg34xxsp) convert_for_device rg34xxsp ;;
    rgds)     convert_for_device rgds ;;
    psp)      convert_for_device psp ;;
    all)      convert_for_device rg34xxsp
              convert_for_device rgds
              convert_for_device psp ;;
    *)        echo "Device inconnu : $1. Valeurs acceptées : rg34xxsp, rgds, psp"
              exit 1 ;;
esac
