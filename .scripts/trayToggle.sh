#!/bin/bash

STYLE=$(sed -n 37p /home/tarek/.config/openbox/polybar/launch.sh  | grep -o '".*"' | sed 's/"//g')

changeTray(){
	if [[ $(grep -i "tray-position = " ~/.config/polybar/config.ini) = "tray-position = right" ]]; then
		sed -i -e 's/tray-position = right/tray-position = none/g' ~/.config/polybar/config.ini
	elif [[ $(grep -i "tray-position = " ~/.config/polybar/config.ini) = "tray-position = none" ]]; then
		sed -i -e 's/tray-position = none/tray-position = right/g' ~/.config/polybar/config.ini
	fi
}
changeTray 
killall -9 polybar 
sh ~/.config/polybar/launch.sh
