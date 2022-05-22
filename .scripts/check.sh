#! /bin/bash

screenshotScript(){
	# Get PID of the screenshot script
  getPid=$(pgrep -f sc.sh)
	if [ $? -eq 0 ]; then
	   echo Already Running:$getPid
	 else
	   nohup ~/.scripts/sc.sh &> /dev/null &
	   disown
	fi
}

DIR="$HOME/Pictures/Screenshots/Temp"
if [ -d "$DIR" ]; then
   # Take action if $DIR exists. #
   screenshotScript
  else 
   # Create Directory and then take action
   mkdir $DIR
   screenshotScript
fi
