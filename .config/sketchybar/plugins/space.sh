#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

# sketchybar --set "$NAME" background.drawing="$SELECTED" icon.color=0xffffffff

COLOR=0xfffabd2f
if [[ "$SELECTED" == true ]]; then
  sketchybar --set "$NAME" icon.color=$COLOR
else
  sketchybar --set "$NAME" icon.color=0xffffffff
fi
