#!/usr/bin/env bash 	

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/polybar/rofi/themes/colors.rasi"
DFILE="$HOME/.config/BetterDiscord/data/stable/custom.css"
NFILE="$HOME/.config/dunst/dunstrc"
GFILE="$HOME/.config/geany/colorschemes/darcula.conf"
ZFILE="$HOME/.config/zathura/zathurarc"
GZFILE="$HOME/.config/zathura/genzathurarc"
ASFILE="$HOME/.cache/wal/colors-rofi-dark.rasi"
AFILE="$HOME/.config/aniwrapper/themes/aniwrapper.rasi"

# Get colors
pywal_set() {
	wpg -s "$1" 
	
}

# Change colors
change_color() {
	
	# polybar
	sed -i -e "s/background = #.*/background = ${BG}10/g" $PFILE
	sed -i -e "s/systemtray = #.*/systemtray = ${ST}77/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" $PFILE
	sed -i -e "s/red = #.*/red = $RED/g" $PFILE
	sed -i -e "s/blue = #.*/blue = $BLUE/g" $PFILE
	sed -i -e "s/yellow = #.*/yellow = $YELLOW/g" $PFILE
	sed -i -e "s/shade4 = #.*/shade4 = $SH4/g" $PFILE
	sed -i -e "s/shade5 = #.*/shade5 = $SH5/g" $PFILE
	sed -i -e "s/shade6 = #.*/shade6 = $SH6/g" $PFILE
	sed -i -e "s/shade7 = #.*/shade7 = $SH7/g" $PFILE
	sed -i -e "s/shade8 = #.*/shade8 = $SH8/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */
	* {
		background:       ${BG}FF; 
		background-alt:   ${BG}FF;
		foreground:       ${FG}FF;
		selected:         ${BLUE}FF;
		highlight:        ${RED}FF;
		urgent:           ${BLUE}FF;
		on:               ${RED}FF;
		off:              ${RED}FF;
	}
		EOF
	
	# discord
	sed -i -e "s/--accent-color: #.*/--accent-color: ${FG};/g" $DFILE
	sed -i -e "s/--settings-icon-color: #.*/--settings-icon-color: ${FG};/g" $DFILE
	sed -i -e "s/--background-1: #.*/--background-1: ${BG};/g" $DFILE
	sed -i -e "s/--background-2: #.*/--background-2: ${BG};/g" $DFILE
	sed -i -e "s/--background-accent: #.*/--background-accent: ${BG};/g" $DFILE
	sed -i -e "s/--button-background-hover: #.*/--button-background-hover: ${RED};/g" $DFILE
	sed -i -e "s/--tab-selected: #.*/--tab-selected: ${BLUE};/g" $DFILE
	sed -i -e "s/--text-muted: #.*/--text-muted: ${FG};/g" $DFILE
	
	# dunst
	sed -i -e "s/background = \"#.*\"/background = \"${BG}\"/g" $NFILE
	sed -i -e "s/foreground = \"#.*\"/foreground = \"${FG}\"/g" $NFILE
	sed -i -e "s/frame_color = \"#.*\"/frame_color = \"${YELLOW}\"/g" $NFILE

	# zathura
	$GZFILE > $ZFILE
	
	
	# aniwrapper 
	cat $ASFILE > $AFILE
	
	# spotify
	# Spotify can be theme using the xrdb backend i.e. ${xrdb:color0:#222}
	
	# geany
	sed -i -e "s/bg=#.*/bg=${BG}/g" $GFILE
	sed -i -e "s/fg=#.*/fg=${FG}/g" $GFILE
	

	
}

# Main
if [[ -f "/usr/bin/wpg" ]]; then
	if [[ "$1" ]]; then
		pywal_set "$1"

		# Source the pywal color file
		. "$HOME/.cache/wal/colors.sh"

		BG=`printf "%s\n" "$background"`
		ST=`printf "%s\n" "$background"`
		FG=`printf "%s\n" "$foreground"`
		FGA=`printf "%s\n" "$foreground"`
		RED=`printf "%s\n" "$color1"`
		BLUE=`printf "%s\n" "$color2"`
		YELLOW=`printf "%s\n" "$color3"`
		SH4=`printf "%s\n" "$color2"`
		SH5=`printf "%s\n" "$color1"`
		SH6=`printf "%s\n" "$color2"`
		SH7=`printf "%s\n" "$color1"`
		SH8=`printf "%s\n" "$color7"`

		change_color
		killall -9 polybar spotify
		sh ~/.config/polybar/launch.sh
		pywalfox update
		openbox --reconfigure
		razer-cli -a
		wal-telegram --wal
		sh ~/.scripts/alacritty_color.sh
		pywal-discord
		spicetify apply
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
