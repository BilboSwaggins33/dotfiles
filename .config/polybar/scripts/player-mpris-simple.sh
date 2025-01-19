#!/bin/sh

player_status=$(playerctl --player=ncspot,spotify_player status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "  $(playerctl --player=ncspot,spotify_player metadata artist) - $(playerctl --player=ncspot,spotify_player metadata title)"
elif [ "$player_status" = "Paused" ]; then
    echo "  $(playerctl --player=ncspot,spotify_player metadata artist) - $(playerctl --player=ncspot,spotify_player metadata title)"
else
    echo "..."
fi
