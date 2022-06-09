#! /bin/bash

yay(){
if command -v git &> /dev/null; then
	echo "git is found, continuing with the installation..."
	cd $HOME
	git clone https://aur.archlinux.org/yay-git.git
	cd yay-git
	makepkg -si && sudo pacman --noconfirm -R go && sudo rm -R ~/yay-git && echo "yay installed successfully"
else 
	sudo pacman -S git && yay
fi	
}

yay
