#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
theme="plasma-chili"

if command -v sddm &> /dev/null; then
	#sudo cp -r $DIR/$theme /usr/share/sddm/themes/ &&
	sudo cp $DIR/theme.conf /etc/sddm.conf.d/
	sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
fi	

