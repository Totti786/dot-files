#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

zsh(){
	if command -v zsh &> /dev/null; then
		sudo pacman -S zsh
		if [ ! -d $HOME/.oh-my-zsh ]; then
			sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh --keep-zshrc --skip-chsh)" && 
			zsh
		fi
		#chsh -s $(which zsh) &&
		cp -r $DIR/zsh/custom ~/.oh-my-zsh/ && echo "moved zsh custom files" &&
		git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions 
		cp -r $DIR/.zshrc ~/ &&
		echo "Zsh should be working now" 
	else 
		echo "Zsh is not installed, installing..." 
		sudo pacman -S zsh 
		zsh
	fi
	}
zsh
