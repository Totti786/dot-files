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

zsh(){
	if command -v zsh &> /dev/null && [ ! -d $HOME/.oh-my-zsh ]; then 
		yay -S zsh &&
		chsh -s $(which zsh) &&
		cp /$DIR/.zshrc ~/ && 
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
		cp -r /$DIR/zsh/custom ~/.oh-my-zsh/ && echo "moved zsh custom files" &&
		git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions &&
		cp -r /$DIR/.zshrc ~/ &&
		echo "Zsh should be working now" 
	else 
		echo "make sure that zsh is installed"
	fi
	}

moveConfigs(){
	cp -r /$DIR/.scripts/ ~/ && echo "moved scripts home" 
	cp -r /$DIR/.config/ ~/ && echo "moved config files"
	cp -r /$DIR/.local/ ~/ && echo "moved fonts and icons"
	sudo cp -r /$DIR/.scripts/bin/ /usr/local/ && echo "moved bin to /usr/local"
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
	zsh
}

"$@"
