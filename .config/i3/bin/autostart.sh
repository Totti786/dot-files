#!/usr/bin/env bash

## Copyright (C) 2020-2021 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3
## Autostart Programs

## Kill already running process
_ps=(picom dunst ksuperkey mpd xfce-polkit xfce4-power-manager polybar trackma-gtk)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

## Fix cursor
xsetroot -cursor_name left_ptr

## Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

## Dunst
dunst &

## Picom	
picom &

## Restore Wallpaper
exec wal -Re &

# Enable power management
xfce4-power-manager &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

## Restore Wallpaper
#nitrogen --restore

## Launch Polybar
bash ~/.config/polybar/launch.sh &

## Excute Screenshot script
bash /home/tarek/.scripts/sc.sh &

## Start mpd
exec mpd &
exec mpd-mpris &

## Thunar Daemon
exec thunar --daemon &

## Touchegg
exec touchegg --daemon &
exec touchegg &

## Discord Launch
exec discord &

## Trackma Launch
exec trackma-gtk 

## KDE Conenct
exec kdeconnect-indicator &

## CopyQ
exec copyq &
