#!/bin/bash

## TODO 
#echo "export QT_QPA_PLATFORMTHEME=gtk2" >> ~/.profile
#export QT_QPA_PLATFORMTHEME="qt5ct"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

createDirs(){
yay -S xdg-user-dirs xdg-user-dirs-gtk &&
xdg-user-dirs-gtk-update
xdg-user-dirs-update
}

moveConfigs(){
	cp -r $DIR/.scripts/ ~/ && echo "moved scripts home" 
	cp -r $DIR/.config/ ~/ && echo "moved config files"
	cp -r $DIR/.local/ ~/ && echo "moved fonts and icons"
	sudo cp -r $DIR/bin/ /usr/local/ && echo "moved bin to /usr/local"
	}

minimal(){
		sudo pacman -S - < minimal.txt
	}

aur(){
		yay -S $(< minimal-aur.txt)
	}

full(){
		sudo pacman -S - < extra.txt
	}
	
install(){
	createDirs
	minimal
	moveConfigs
}

"$@"
