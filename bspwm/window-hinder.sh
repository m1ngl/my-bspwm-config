#!/bin/bash

export params=$1

if [ $params = hind ]; then
	bspc node focused -g hidden
else
	if [ $params = show ]; then
		if [ "$(bspc query --desktop focused --names --desktops)"\
		   = "$(bspc query --node any.hidden --names --desktops)" ]; then
			bspc node prev.hidden -g hidden=off
		fi
	fi
fi
