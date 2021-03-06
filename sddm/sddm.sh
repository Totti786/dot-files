#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
theme="arch"

# TODO add a feature that check the window manager and disables it 
# grep 'ExecStart=' /etc/systemd/system/display-manager.service | cut -f2 -d  "="

changeDM(){
current=$(grep 'ExecStart=' /etc/systemd/system/display-manager.service | cut -f2 -d  "=")
}

installSDDM(){
if command -v sddm &> /dev/null; then
	if [ -d "/usr/share/sddm/themes/$theme" ]; then  
		if [ -f "/etc/sddm.conf.d/theme.conf" ];then
			echo "theme conf file found moving files" 
			sudo sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
			cp -r $DIR/.face.icon ~/.face.icon
			sudo rm /usr/share/sddm/faces/.face.icon
			sudo ln ~/.face.icon /usr/share/sddm/faces/.face.icon
		else
			echo "theme conf file not found creating and moving files" 
			sudo mkdir /etc/sddm.conf.d/ &&
			sudo cp $DIR/theme.conf /etc/sddm.conf.d/ &&
			sudo sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
			sudo cp -r $DIR/.face.icon /usr/share/sddm/faces/
		fi
	else 
		sudo cp -r $DIR/$theme /usr/share/sddm/themes/ &&
		installSDDM
	fi
else
	yay -S sddm plasma-framework && 
	sudo systemctl enable sddm.service && 
	main
fi	
}

installSDDM
