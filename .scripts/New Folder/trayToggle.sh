#!/bin/bash

STYLE=$(sed -n 37p /home/tarek/.config/openbox/polybar/launch.sh  | grep -o '".*"' | sed 's/"//g')

changeTray(){
	if [[ $(grep -i "tray-position = " ~/.config/openbox/polybar/$STYLE/config.ini) = "tray-position = right" ]]; then
		sed -i -e 's/tray-position = right/tray-position = none/g' ~/.config/openbox/polybar/$STYLE/config.ini
	elif [[ $(grep -i "tray-position = " ~/.config/openbox/polybar/$STYLE/config.ini) = "tray-position = none" ]]; then
		sed -i -e 's/tray-position = none/tray-position = right/g' ~/.config/openbox/polybar/$STYLE/config.ini
	fi
}

changeTray
killall -q polybar
sh ~/.config/openbox/polybar/launch.sh
