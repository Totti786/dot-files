#! /bin/bash

apps=(polybar openbox i3 zathura mpv GIMP dunst alacritty geany ranger htop Thunar)
DIR="$HOME/.config/"
BackupDir="$HOME/Documents/GitHub/dot-files/"

for bapps in "${apps[@]}"; do
	
    cp -r $DIR/$bapps $BackupDir/.config
    
    rm -R $BackupDir/.scripts && cp -r $HOME/.scripts $BackupDir

done
