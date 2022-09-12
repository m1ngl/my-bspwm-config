#!/bin/bash

BAT=$(cat /sys/class/power_supply/BAT0/capacity)
STAT=$(cat /sys/class/power_supply/BAT0/status)
if [ "$STAT" = "Charging" ]; then
	export BAT="${BAT}%(正在充电)"
else
	export BAT="${BAT}%"
fi

echo ${BAT}
