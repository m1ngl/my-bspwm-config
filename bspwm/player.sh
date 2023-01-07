#!/bin/bash

playerctl status &>/dev/null || exit

rst="$(echo -e "Previous\nPlay & Pause\nNext" | rofi -dmenu -window-title 'Player Controller')" || exit
echo $rst
[ "$rst" = "Previous" ] && playerctl previous

[ "$rst" = "Play & Pause" ] && playerctl play-pause

[ "$rst" = "Next" ] && playerctl next
