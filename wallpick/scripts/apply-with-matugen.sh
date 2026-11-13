#!/usr/bin/env bash
set -euo pipefail

APPLY_SCRIPT="$1"
WALLPAPER="$2"
SCREEN="$3"
TRANSITION="$4"

# Aplicar wallpaper con Wallpick
bash "$APPLY_SCRIPT" set "$WALLPAPER" "$SCREEN" "$TRANSITION"

# Preparar entrada para Matugen
EXT="${WALLPAPER##*.}"
EXT="${EXT,,}"

case "$EXT" in
    mp4|mkv|webm|mov|avi|m4v)
        CACHE="$HOME/.cache/wallpick/matugen"
        mkdir -p "$CACHE"

        HASH=$(printf '%s' "$WALLPAPER" | sha256sum | cut -c1-16)
        SOURCE="$CACHE/frame_$HASH.png"

        if [[ ! -s "$SOURCE" ]]; then
            ffmpeg -y -loglevel error \
                -ss 0.5 -i "$WALLPAPER" \
                -frames:v 1 "$SOURCE"
        fi
        ;;
    *)
        SOURCE="$WALLPAPER"
        ;;
esac

# Generar colores
matugen image "$SOURCE" -m dark --source-color-index 0
