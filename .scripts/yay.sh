#! /bin/bash

yay(){
if command -v git &> /dev/null; then
	echo "git is found, continuing with the installation..."
	git clone https://aur.archlinux.org/yay-git.git
	cd yay-git
	sudo makepkg -si && echo "yay installed successfully"
else 
	sudo pacman -S --needed base-devel git && yay
fi	
}

yay &&
sudo rm -R yay-git
