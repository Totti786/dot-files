#!/bin/bash

## TODO 
#echo "export QT_QPA_PLATFORMTHEME=gtk2" >> ~/.profile
#export QT_QPA_PLATFORMTHEME="qt5ct"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

createDirs(){
yay -S xdg-user-dirs xdg-user-dirs-gtk &&
xdg-user-dirs-update && xdg-user-dirs-gtk-update
}

moveConfigs(){
	cp -r $DIR/.scripts/ ~/ && echo "moved scripts home" 
	cp -r $DIR/.config/ ~/ && echo "moved config files"
	cp -r $DIR/.local/ ~/ && echo "moved fonts and icons"
	sudo cp -r $DIR/bin/ /usr/local/ && echo "moved bin to /usr/local"
	}

changeTheme(){
	xfconf-query -c xsettings -p /Net/ThemeName -s "FlatColor"
	xfconf-query -c xsettings -p /Net/IconThemeName -s "Luna-Dark"	
	cp -r $DIR/.icons ~/
	}

wpgtk(){
	sh $DIR/.scripts/wpgtk 
	cp $DIR/background.jpg ~/.config/wpg/wallpapers/wallpaper.jpg
	wpg -m
	sh $DIR/.scripts/wpgtk lockWal
	}

minimal(){
		sudo yay -S - < minimal.txt
	}

aur(){
		yay -S $(< minimal-aur.txt)
	}

full(){
		sudo pacman -S - < extra.txt
	}
	
install(){
	sh $DIR/zsh/zsh.sh
	cd grub && sudo sh $DIR/grub/grub.sh && cd $DIR
	cd sddm && sh $DIR/sddm/sddm.sh && cd $DIR
	createDirs
	minimal
	moveConfigs
	aur
	changeTheme
	wpgtk
}

"$@"
