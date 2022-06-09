#!/bin/bash

# This script takes all mkv files in the current directory and sets the filename
# (without .mkv) as its title in metadata


if command -v mkvpropedit; then 
	for mkvfile in *.mkv; do
	        mkvpropedit "$mkvfile" -e info -s title="${mkvfile%.mkv}"
	    done
else 
	echo "mkvtoolnix not found"
	echo "Installing..."
	yay -S mkvtoolnix-cli
fi
