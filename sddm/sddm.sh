#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
theme="plasma-chili"

if command -v sddm &> /dev/null; then
	yay -S plasma-framework &&
	sudo cp -r $DIR/$theme /usr/share/sddm/themes/ &&
	sudo mkdir /etc/sddm.conf.d/
	sudo cp $DIR/theme.conf /etc/sddm.conf.d/ &&
	sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
fi	
