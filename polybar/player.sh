#!/bin/bash
export playerlist=$(playerctl -l 2>/dev/null|grep -iE '(spotify|yesplaymusic)')

if [ -z "$playerlist" ]; then
	echo ""
else
	export playing=$(playerctl --player=$playerlist metadata title 2>/dev/null)
	if [ -z "$playing" ]; then
		echo ""
	else
		if [ -z "$playing" ]; then
			echo ""
		else
			echo "[${playerlist} : ${playing}]"
		fi
	fi
fi
