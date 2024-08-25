#!/bin/bash

while true; do
  result=$(
    rofi -dmenu -display-columns 2 \
      -kb-custom-1 "Control-Delete" \
      -kb-custom-2 "Alt-Delete" \
      -config ~/.config/rofi/launchers/type-1/style-5.rasi < <(cliphist list)
  )

  case "$?" in
  1)
    exit
    ;;
  0)
    case "$result" in
    "")
      continue
      ;;
    *)
      cliphist decode <<<"$result" | wl-copy
      exit
      ;;
    esac
    ;;
  10)
    cliphist delete <<<"$result"
    ;;
  11)
    cliphist wipe
    ;;
  esac
done
