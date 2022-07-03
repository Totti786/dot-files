#!/usr/bin/env bash 	

device=$(bluetoothctl devices | head -n1 | cut -d " " -f2)

toggle(){
	if [[ $(bluetoothctl info) = "Missing device address argument" ]]; then
		bluetoothctl connect $device
	else
		bluetoothctl disconnect
	fi
	}

main(){
if command -v bluetoothctl &> /dev/null; then
	if bluetoothctl show | grep -q "Powered: yes"; then
		 toggle	
		   bluetoothctl power on >> /dev/null
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
