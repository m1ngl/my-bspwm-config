#!/bin/bash

    export old_recv=$(cat /sys/class/net/wlp2s0/statistics/rx_bytes)
    export old_tran=$(cat /sys/class/net/wlp2s0/statistics/tx_bytes)
    sleep 1
    export new_recv=$(cat /sys/class/net/wlp2s0/statistics/rx_bytes)
    export new_tran=$(cat /sys/class/net/wlp2s0/statistics/tx_bytes)

    export sp_recv=$[ $new_recv - $old_recv ]
    export sp_tran=$[ $new_tran - $old_tran ]
    if [ $sp_recv -ge 1048576 ]; then
	export sp_recv="$(echo "scale=1; $sp_recv / 1048576 "|bc)M/s"
    else
	if [ $sp_recv -ge 2048 ]; then
        	export sp_recv="$(echo "scale=1; $sp_recv / 1024 "|bc)K/s"
    	else
		export sp_recv="${sp_recv}B/s"
	fi
    fi
    if [ $sp_tran -gt 1048576 ]; then
        export sp_tran="$(echo "scale=1; $sp_tran / 1048576 "|bc)M/s"
    else
        if [ $sp_tran -ge 2048 ]; then
    	    export sp_tran="$(echo "scale=1; $sp_tran / 1024 "|bc)K/s"
	else
	    export sp_tran="${sp_tran}B/s"
        fi
    fi

    echo "[${sp_tran} ${sp_recv}]"
