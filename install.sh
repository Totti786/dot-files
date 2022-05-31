#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

dirs=(Documents Music Pictures Pictures/Screenshots Videos Downloads Desktop)
for dir in "${dirs[@]}"; do
	if [ -d "$HOME/$dir" ]; then
		echo "dir already exists" 
	else 
		mkdir $HOME/$dir
	fi
done


zsh(){
	if command -v zsh; then 
		chsh -s $(which zsh) &&
		cp /$DIR/.zshrc ~/ && 
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		echo "zsh should be working now"
	fi
	}

programs(){
		sudo pacman -S - < essentials.txt
	}
main(){
	sudo cp -r /$DIR/.scripts/bin/ /usr/local/ && echo "moved bin to /usr/local"
	cp -r /$DIR/.scripts/ ~/ && echo "moved scripts home" 
	cp -r /$DIR/.config/ ~/ && echo "moved config files"
	cp -r /$DIR/.local/ ~/ && echo "moved fonts and icons"
	cp -r /$DIR/.ncmpcpp/ ~/ && echo "moved nvmpcpp home"

}

"$@"
