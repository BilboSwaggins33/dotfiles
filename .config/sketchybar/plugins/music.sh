sleep 0.5

PLAYING=$(~/.config/sketchybar/plugins/spotify.sh)

if [[ $PLAYING != "None" ]]; then
        sketchybar --set $NAME label.drawing=on icon.drawing=on
	sketchybar --set $NAME label="$PLAYING" icon="􀑪" icon.padding_right=4.0 icon.font.size=8.0 label.padding_right=20.0
else
	sketchybar --set $NAME label.drawing=off icon.drawing=off
fi
