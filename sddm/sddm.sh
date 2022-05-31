#!/bin/bash

theme="plasma-chili"
if command -v sddm; then
	sudo cp /$theme /usr/share/sddm/themes/ &&
	sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
fi	

