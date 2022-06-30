#!/usr/bin/env bash
DIR= ~/.config/polybar/scripts
get_total_updates() { UPDATES=$(sh $DIR/checkupdates 2>/dev/null | wc -l); }

while true; do
    get_total_updates

    while (( UPDATES > 0 )); do
        if (( UPDATES == 1 )); then
            echo " $UPDATES"
        elif (( UPDATES > 1 )); then
            echo " $UPDATES"
        else
            echo " None"
        fi
        sleep 500
        get_total_updates
    done
    
    while (( UPDATES == 0 )); do
        echo " None"
        sleep 3600
        get_total_updates
    done
done
