#! /bin/bash
apps=(polybar openbox i3 zathura mpv GIMP)
Dir="$HOME/.config/"
BackupDir="$HOME/Documents/GitHub/dot-files/"

for bapps in "${apps[@]}"; do
	
    cp -r $Dir/$bapps $BackupDir/.config
    
    rm -R $BackupDir/.scripts && cp -r $HOME/.scripts $BackupDir

done
