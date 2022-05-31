#!/bin/bash

main(){
if command -v plymouth; then 
	sudo cp -r deus_ex /usr/share/plymouth/themes/
	sudo plymouth-set-default-theme -l
	# now set the theme (angular, in this case) and rebuilt the initrd
	sudo plymouth-set-default-theme -R deus_ex
else 
	yay -S plymouth && 
	main	
fi
}

main
