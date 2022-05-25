#!/usr/bin/env bash 	

device=$(bluetoothctl devices | sed -r 's/.{12}$//g' | sed 's/Device //g')

toggle(){
	if [[ $(bluetoothctl info) = "Missing device address argument" ]]; then
		bluetoothctl connect $device
	else
		bluetoothctl disconnect

	fi
	}

main(){
if command -v bluetoothctl; then
	if [[ $(bluetooth) = "bluetooth = on" ]]; then
		 toggle	
	else 
		bluetoothctl power on
		main
	fi
else 
	echo "bluetoothctl not installed"
	exit 0
fi
}
main
