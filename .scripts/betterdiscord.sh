#! /bin/bash

installBetterdiscord(){
if command -v betterdiscordctl &> /dev/null; then 
		if [[ "$(betterdiscordctl status | sed -n 6p)" = "Discord \"index.js\" injected: no" ]]; then 
			echo "Installing..."
			betterdiscordctl install
		else 
			echo "Installed"
		fi	
else 
	yay -S betterdiscordctl &&
	installBetterdiscord
fi
}

installBetterdiscord
