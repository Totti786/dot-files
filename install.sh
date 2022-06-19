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
	cat > ~/.icons/default/index.theme <<- EOF
		[Icon Theme]
		Name=Default
		Comment=Default Cursor Theme
		Inherits=Fluent-dark
	EOF
	}

minimal(){
		sudo pacman -S - < minimal.txt
	}

wpgtk(){
	sh $DIR/.scripts/wpgtk 
	cp $DIR/background.jpg ~/.config/wpg/wallpapers/wallpaper.jpg
	sh $DIR/.scripts/wpgtk setWal
	sh $DIR/.scripts/wpgtk lockWal


	}

aur(){
		yay -S $(< minimal-aur.txt)
	}

full(){
		sudo pacman -S - < extra.txt
	}
	
install(){
	sh $DIR/zsh/zsh.sh
	sh $DIR/grub/grub.sh
	sh $DIR/sddm/sddm.sh
	createDirs
	minimal
	moveConfigs
	aur
	changeTheme
}

"$@"
