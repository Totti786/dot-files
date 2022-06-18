#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

main(){
if command -v plymouth &> /dev/null; then 
	sudo cp -r $DIR/deus_ex /usr/share/plymouth/themes/
	sudo plymouth-set-default-theme -l
	# now set the theme (deus_ex, in this case) and rebuilt the initrd
	sudo plymouth-set-default-theme -R deus_ex
else 
	yay -S plymouth && 
	main	
fi
}

main
