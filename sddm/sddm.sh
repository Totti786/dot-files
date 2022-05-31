#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
theme="plasma-chili"
if command -v sddm &> /dev/null; then
	sudo cp $DIR/$theme /usr/share/sddm/themes/ &&
	sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
fi	

