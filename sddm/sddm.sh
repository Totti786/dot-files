#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
theme="plasma-chili"

if command -v sddm &> /dev/null; then
	sudo cp $DIR/$theme /usr/share/sddm/themes/ &&
	#sed -i -e "s/Current=.*/Current=$theme/g" /etc/sddm.conf.d/theme.conf
cat > /etc/sddm.conf.d/theme.conf <<- EOF 
		[Theme]
		
		# Current theme name
		Current=$theme
		
		# Cursor theme used in the greeter
		CursorTheme=Fluent-dark
		
		# Number of users to use as threshold
		# above which avatars are disabled
		# unless explicitly enabled with EnableAvatars
		DisableAvatarsThreshold=7
		
		# Enable display of custom user avatars
		EnableAvatars=true
		
		# Global directory for user avatars
		# The files should be named <username>.face.icon
		FacesDir=/usr/share/sddm/faces
		
		# Font used in the greeter
		Font="Iosevka"
		
		# Theme directory path
		ThemeDir=/usr/share/sddm/themes
	EOF
fi	

