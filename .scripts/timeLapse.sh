#!/bin/bash

cd ~/Videos/TimeLapse

Name=$(date +'%m-%d-%Y-%A') 

ffmpeg -framerate 10 -pattern_type glob -i "/home/tarek/Pictures/Screenshots/Temp/*.png" -s:v 1920x1080 -c:v libx264 -crf 17 -pix_fmt yuv420p $Name.mp4 


cd  ~/Pictures/Screenshots/Temp 
rm *.png
