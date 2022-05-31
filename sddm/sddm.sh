#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
theme="plasma-chili"

main(){
if command -v sddm &> /dev/null; then
	sudo cp -r $DIR/$theme /usr/share/sddm/themes/ &&
	if [ -f /etc/sddm.conf.d/theme.conf ];then
		sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
	else
		sudo mkdir /etc/sddm.conf.d/ &&
		sudo cp $DIR/theme.conf /etc/sddm.conf.d/ &&
		sudo sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf

	fi
else
	yay -S sddm plasma-framework && 
	sudo systemctl enable sddm.service
fi	
}
main
