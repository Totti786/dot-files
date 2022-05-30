#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

dirs=(Documents Music Pictures Pictures/Screenshots Videos Downloads Desktop)
for dir in "${dirs[@]}"; do
	if [ -d "$HOME/$dir" ]; then
		echo "fuck"
	else 
		echo "shit"
		mkdir $HOME/$dir
	fi
done



#sudo cp -r /$DIR/.scripts/bin/ /usr/local/ && echo "moved bin to /usr/local"
#cp -r /$DIR/.scripts/ ~/ && echo "moved scripts home" 
#cp -r /$DIR/.config/ ~/.config && echo ""
#cp -r /$DIR/.local/ ~/.local && echo ""
#cp -r /$DIR/.ncmpcpp/ ~/ && echo "moved nvmpcpp home"
#cp /$DIR/.zshrc ~/ && echo ""
