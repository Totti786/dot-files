#!/bin/sh

check(){
	if bluetoothctl show | grep -q "Powered: no"; then
		echo  
	elif bluetoothctl show | grep -q "Powered: yes"; then
		echo  $(bluetoothctl devices Connected | head -n1 | cut -d " " -f3,4,5)
	fi
	}
check
