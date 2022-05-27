#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

#sudo cp -r /$DIR/.scripts/bin/ /usr/local/

cp -r /$DIR/.scripts/ ~/
#cp -r /$DIR/.config/ ~/.config
#cp -r /$DIR/.local/ ~/.local
cp -r /$DIR/.ncmpcpp/ ~/
cp -r /$DIR/.oh-my-zsh/ ~/
cp /$DIR/.zshrc ~/
