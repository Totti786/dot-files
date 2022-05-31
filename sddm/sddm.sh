#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
theme="plasma-chili"

main(){
if command -v sddm &> /dev/null; then
	if [ -d "/usr/share/sddm/themes/$theme" ]; then  
		if [ -f "/etc/sddm.conf.d/theme.conf" ];then
			sudo sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
		else
			sudo mkdir /etc/sddm.conf.d/ &&
			sudo cp $DIR/theme.conf /etc/sddm.conf.d/ &&
			sudo sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
		fi
	else 
		sudo cp -r $DIR/$theme /usr/share/sddm/themes/ &&
		main
	fi
else
	yay -S sddm plasma-framework && 
	sudo systemctl enable sddm.service && 
	main
fi	
}


if [ $( grep 'ExecStart=' /etc/systemd/system/display-manager.service )  = "ExecStart=/usr/bin/lightdm"]
	sudo systemctl disable lightdm.service &&
	sudo pacman -R lightdm-gtk-greeter ligthdm
	main
else
	main
fi

