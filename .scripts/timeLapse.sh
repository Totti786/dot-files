#!/bin/bash

VDir="$HOME/Videos/TimeLapse"
SDir="$HOME/Pictures/Screenshots/Temp"
Name=$(date +'%m-%d-%Y-%A') 
File="$VDir/$Name.mp4"

# Created a timelaspe of the screenshots taken by the screenshot scripts
createVideo(){
	cd $VDir
	ffmpeg -framerate 10 -pattern_type glob -i "$HOME/Pictures/Screenshots/Temp/*.png" \
	-s:v 1920x1080 -c:v libx264 -crf 17 -pix_fmt yuv420p $Name.mp4 
}
# Deletes all the screen shot from the directory
deleteScreenshots(){
	cd $SDir && rm *.png
}

checkFile(){
	# Check if the video file has been created
	if [[ -f "$File" ]]; then
		deleteScreenshots
		echo "Deleted files"
	 else 
		echo "Video File not found"
	fi
}
# checks if the video directory exists and if not it creates one then excutes 
if [ -d "$VDIR" ]; then
   # Take action if $DIR exists. #
   createVideo
   checkFile
  else 
   # Create directory and then take action
   mkdir $VDir
   createVideo
   checkFile
fi
