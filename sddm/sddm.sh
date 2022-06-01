#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
theme="plasma-chili"

main(){
if command -v sddm &> /dev/null; then
	if [ -d "/usr/share/sddm/themes/$theme" ]; then  
		if [ -f "/etc/sddm.conf.d/theme.conf" ];then
			sudo sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
			sudo cp -r $DIR/sddm/.face.icon /usr/share/sddm/faces 
		else
			sudo mkdir /etc/sddm.conf.d/ &&
			sudo cp $DIR/theme.conf /etc/sddm.conf.d/ &&
			sudo sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
			sudo cp -r $DIR/sddm/.face.icon /usr/share/sddm/faces
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

main
