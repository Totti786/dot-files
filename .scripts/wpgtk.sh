#!/usr/bin/env bash 	

# Color files
ALFILE="$HOME/.config/alacritty/colors.yml"
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/polybar/rofi/themes/colors.rasi"
DFILE="$HOME/.config/BetterDiscord/data/stable/custom.css"
NFILE="$HOME/.config/dunst/dunstrc"
GFILE="$HOME/.config/geany/colorschemes/darcula.conf"
ZFILE="$HOME/.config/zathura/zathurarc"
GZFILE="$HOME/.config/zathura/genzathurarc"
ASFILE="$HOME/.cache/wal/colors-rofi-dark.rasi"
AFILE="$HOME/.config/aniwrapper/themes/aniwrapper.rasi"
apps=(betterlockscreen wal-telegram spicetify pywalfox openbox\
	 aniwrapper polybar rofi zathura geany alacritty dunst betterdiscordctl)


# Change colors
change_color() {
	
	# polybar	
	cat > $PFILE <<- EOF
		[color]
		;; main colors
		background = ${BG}
		systemtray = ${ST}
		foreground = $FG
		primary = $FG
		red = $red
		green = $green
		yellow = $yellow
		blue = $blue
		magenta = $magenta
		cyan = $cyan
		white = $white
		
		EOF
		
	# rofi
	cat > $RFILE <<- EOF
	/* colors */
	* {
		background:       ${BG}FF; 
		background-alt:   ${BG}FF;
		foreground:       ${FG}FF;
		selected:         ${blue}FF;
		highlight:        ${FG}FF;
		urgent:           ${blue}FF;
		on:               ${red}FF;
		off:              ${red}FF;
	}
		EOF
	
	# alacritty 
	cat > $ALFILE <<- EOF 
	#Colors 
	colors:
	  primary:
	    background: '$BG'
	    foreground: '$FG'
	  cursor:
	    text:       '$black'
	    cursor:     '$white'
	  normal:
	    black:      '$black'
	    red:        '$red'
	    green:      '$green'
	    yellow:     '$yellow'
	    blue:       '$blue'
	    magenta:    '$magenta'
	    cyan:       '$cyan'
	    white:      '$white'
	  bright:
	    black:      '$bright_black'
	    red:        '$bright_red'
	    green:      '$bright_green'
	    yellow:     '$bright_yellow'
	    blue:       '$bright_blue'
	    magenta:    '$bright_magenta'
	    cyan:       '$bright_cyan'
	    white:      '$bright_white'
	EOF
	
	# discord
	sed -i -e "s/--accent-color: #.*/--accent-color: ${FG};/g" $DFILE
	sed -i -e "s/--settings-icon-color: #.*/--settings-icon-color: ${FG};/g" $DFILE
	sed -i -e "s/--background-1: #.*/--background-1: ${BG};/g" $DFILE
	sed -i -e "s/--background-2: #.*/--background-2: ${BG};/g" $DFILE
	sed -i -e "s/--background-accent: #.*/--background-accent: ${BG};/g" $DFILE
	sed -i -e "s/--button-background-hover: #.*/--button-background-hover: ${red};/g" $DFILE
	sed -i -e "s/--tab-selected: #.*/--tab-selected: ${blue};/g" $DFILE
	sed -i -e "s/--text-muted: #.*/--text-muted: ${FG};/g" $DFILE
	
	# dunst
	sed -i -e "s/background = \"#.*\"/background = \"${BG}\"/g" $NFILE
	sed -i -e "s/foreground = \"#.*\"/foreground = \"${FG}\"/g" $NFILE
	sed -i -e "s/frame_color = \"#.*\"/frame_color = \"${yellow}\"/g" $NFILE

	# zathura
	$GZFILE > $ZFILE
		
	# aniwrapper 
	cat $ASFILE > $AFILE
	
	# spotify
	# Spotify can be theme using the xrdb backend i.e. ${xrdb:color0:#222}
	
	# geany
	sed -i -e "s/bg=#.*/bg=${BG}/g" $GFILE
	sed -i -e "s/fg=#.*/fg=${FG}/g" $GFILE
	sed -i -e "s/margin_bg_grey=#.*/margin_bg_grey=${black}/g" $GFILE
	

	
}

checkApps(){
	for _apps in "${apps[@]}"; do
		let i++
		if ! command -v $_apps &> /dev/null; then
			apps1+=("$_apps ")			
		else 
			if [[ $i = "${#apps[@]}" ]]; then 
				main
				break		
			fi
		fi
	done
	
	if [[ "${#apps1[@]}" > 0 ]]; then
		yay -S ${apps1[@]} && checkApps
		exit 0
	fi
	}

phone_wal(){
	deviceID=$(kdeconnect-cli --id-only  -l)
	cp $wallpaper /home/tarek/.config/wpg/wallpapers/wallpaper.jpg \
	&& kdeconnect-cli -d $deviceID --share \
	/home/tarek/.config/wpg/wallpapers/wallpaper.jpg && kdeconnect-cli -d $deviceID --ping
	}

## Kill already running process
kill(){
	_ps=(polybar spotify dunst)
	for _prs in "${_ps[@]}"; do
		if [[ `pidof ${_prs}` ]]; then
			killall -9 ${_prs}
		fi
	done
	}
	
main(){
	change_color
	#razer-cli -a
	#kill
	#pywalfox update
	openbox --reconfigure
	#sh ~/.config/polybar/launch.sh
	wal-telegram --wal
	spicetify update
	#betterlockscreen -u $wallpaper
	#phone_wal
	}


# Check if wpg is installed and get colors
if [[ -f "/usr/bin/wpg" ]]; then
	
	# Source the pywal color file
	. "$HOME/.cache/wal/colors.sh"

	# Normal colors
	BG=`printf "%s\n" "$background"`
	ST=`printf "%s\n" "$background"`
	FG=`printf "%s\n" "$foreground"`
	FGA=`printf "%s\n" "$foreground"`
	black=`printf "%s\n" "$color0"`
	red=`printf "%s\n" "$color1"`
	green=`printf "%s\n" "$color2"`
	yellow=`printf "%s\n" "$color3"`
	blue=`printf "%s\n" "$color4"`
	magenta=`printf "%s\n" "$color5"`
	cyan=`printf "%s\n" "$color6"`
	white=`printf "%s\n" "$color7"`
	# Bright colors
	bright_black=`printf "%s\n" "$color8"`
	bright_red=`printf "%s\n" "$color9"`
	bright_green=`printf "%s\n" "$color10"`
	bright_yellow=`printf "%s\n" "$color11"`
	bright_blue=`printf "%s\n" "$color12"`
	bright_magenta=`printf "%s\n" "$color13"`
	bright_cyan=`printf "%s\n" "$color14"`
	bright_white=`printf "%s\n" "$color15"`
	xrdb -merge ~/.cache/wal/colors.Xresources
	
else
	echo "[!] 'wpgtk' is not installed."
	echo "Installing from the AUR..." 
	yay -S wpgtk-git && wpg-install.sh -og
fi

"$@"
