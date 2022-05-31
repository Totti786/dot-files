#! /bin/bash

yay(){
if command -v git &> /dev/null; then
	echo "git is found, continuing with the installation..."
	git clone https://aur.archlinux.org/yay-git.git
	cd yay-git
	makepkg -si && echo "yay installed successfully"
else 
	sudo pacman -S --needed base-devel git && yay
fi	
}

if command -v yay &> /dev/null; then 
	echo "yay is already installed"
else 
	 yay
fi
