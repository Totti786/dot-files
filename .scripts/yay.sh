#! /bin/bash

yay(){
if command -v git &> /dev/null; then
	echo "git is found, continuing the installation..."
	cd /opt
	sudo git clone https://aur.archlinux.org/yay-git.git
	echo "Enter your username" && read username
	echo "Your user name is $username"
	sudo chown -R $username:$username ./yay-git && cd yay-git
	makepkg -si
else 
	sudo pacman -S git && yay
fi	
}
yay
