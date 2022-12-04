#!/bin/bash
export playerlist=$(playerctl -l 2>/dev/null|grep -iE '(spotify|yesplaymusic)')

if [ -z "$playerlist" ]; then
	echo "未在播放"
else
	export playing=$(playerctl --player=$playerlist metadata title 2>/dev/null)
	if [ -z "$playing" ]; then
		echo "未在播放"
	else
		if [ -z "$playing" ]; then
			echo "正在读取"
		else
			echo "${playerlist} : ${playing}"
		fi
	fi
fi
