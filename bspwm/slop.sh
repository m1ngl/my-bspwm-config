#!/bin/bash
read -r X Y W H < <(slop -f "%x %y %w %h" -b 1 -t 0 -q)
if [ -z $X ]; then
	exit
fi
(( W /= 11))
(( H /= 23))
g=${W}x${H}+${X}+${Y}
st -g $g & disown
