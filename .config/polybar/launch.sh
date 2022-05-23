#!/usr/bin/env bash

## Copyright (C) 2020-2021 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
RFILE="$DIR/.module"
SFILE="$DIR/system.ini"
CARD="$(light -L | grep 'backlight' | head -n1 | cut -d'/' -f3)"
INTERFACE="$(ip link | awk '/state UP/ {print $2}' | tr -d :)"
BATTERY=$(upower -i `upower -e | grep 'BAT'` | grep 'native-path' | cut -d':' -f2 | tr -d '[:blank:]')
ADAPTER=$(upower -i `upower -e | grep 'AC'` | grep 'native-path' | cut -d':' -f2 | tr -d '[:blank:]')
current_desktop=$(wmctrl -m |sed -n 1p | sed -e 's/Name: //g') 



# Fix backlight and network modules
fix_modules() {
	if [[ -z "$CARD" ]]; then
		sed -i -e 's/backlight/bna/g' "$DIR"/config.ini
	elif [[ "$CARD" != *"intel_"* ]]; then
		sed -i -e 's/backlight/brightness/g' "$DIR"/config.ini
	fi
	
	if [[ $current_desktop == "bspwm" ]]; then
		sed -i -e 's/modules-center = workspaces/modules-center = bspwm/g' "$DIR"/config.ini
	
	else 
		sed -i -e 's/modules-center = bspwm/modules-center = workspaces/g' "$DIR"/config.ini
	fi
	
	if [[ "$INTERFACE" == e* ]]; then
		sed -i -e 's/network/ethernet/g' "$DIR"/config.ini
	fi
}

## Write values to `system` file
set_values() {
	if [[ "$ADAPTER" ]]; then
		sed -i -e "s/adapter = .*/adapter = $ADAPTER/g" 						${SFILE}
	fi
	if [[ "$BATTERY" ]]; then
		sed -i -e "s/battery = .*/battery = $BATTERY/g" 						${SFILE}
	fi
	if [[ "$CARD" ]]; then
		sed -i -e "s/graphics_card = .*/graphics_card = $CARD/g" 				${SFILE}
	fi
	if [[ "$INTERFACE" ]]; then
		sed -i -e "s/network_interface = .*/network_interface = $INTERFACE/g" 	${SFILE}
	fi
}


# Launch the bar
launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Launch the bar
	polybar -q top -c "$DIR"/config.ini &
	#polybar -q topRight -c "$DIR"/config.ini &
	#polybar -q topCenter -c "$DIR"/config.ini &
	#polybar -q topLeft -c "$DIR"/config.ini &
	polybar -q bottom -c "$DIR"/config.ini &
}

# Execute functions
#if [[ ! -f "$RFILE" ]]; then
	
	#touch "$RFILE"
#fi	
set_values
fix_modules
launch_bar
