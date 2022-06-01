#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

createDirs(){
yay -S xdg-user-dirs xdg-user-dirs-gtk &&
xdg-user-dirs-gtk-update
xdg-user-dirs-update
}

zsh(){
	if command -v zsh &> /dev/null && [ ! -d $HOME/.oh-my-zsh ]; then 
		chsh -s $(which zsh) &&
		cp /$DIR/.zshrc ~/ && 
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		echo "Zsh should be working now"
	else 
		echo "Zsh is already installed"
	fi
	}

moveConfigs(){
	cp -r /$DIR/.scripts/ ~/ && echo "moved scripts home" 
	cp -r /$DIR/.config/ ~/ && echo "moved config files"
	cp -r /$DIR/.local/ ~/ && echo "moved fonts and icons"
	cp -r /$DIR/.ncmpcpp/ ~/ && echo "moved nvmpcpp home"
	sudo cp -r /$DIR/.scripts/bin/ /usr/local/ && echo "moved bin to /usr/local"
	}

installMinimal(){
		yay -S - < minimal.txt
	}
	
installFull(){
		yay -S - < full.txt
	}
	
main(){
	createDirs
	zsh
}

"$@"
