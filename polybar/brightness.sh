#!/bin/bash
export current_BRT=$(xrandr --verbose|grep Brightness|gawk -F: -F\  '{print $2}')
export opt=$1
export num=$2
if [ -z $opt ]; then
	:
else
	if [ $opt = add ]; then
		if [ $current_BRT == 2.1 ]; then
			:
		else
			export current_BRT=$(echo "$current_BRT + 0.05 "|bc)
			xrandr --output eDP-1 --brightness $current_BRT
		fi
	else	
		if [ $current_BRT == 0.30 ]; then
			:
		else
			if [ $current_BRT \> 1.0 ]; then
				echo $current_BRT
				export current_BRT=$(echo "$current_BRT - 0.1"|bc)
				xrandr --output eDP-1 --brightness $current_BRT
			else
				export current_BRT=$(echo "$current_BRT - 0.05 "|bc)
				xrandr --output eDP-1 --brightness $current_BRT
			fi
		fi
	fi
fi

echo "$(echo "$current_BRT * 100"|bc|gawk -F. '{print $1}')%"
