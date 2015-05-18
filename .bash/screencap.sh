#!/bin/bash

# Creates a directory on the desktop called screens and takes
# screenshots of the display at regular intervals and saves the
# results in screens.
# Schermafbeelding 2014-09-01 om 19.45.41

if [ ! -z "$1" ]; then
mkdir ~/Desktop/screens
prefix="$HOME/Desktop/screens/Schermafbeelding "
suffix=".png"
while true; do
	time=$(date +%Y-%m-%d" om "%H.%M.%S)
	filename="$prefix$time$suffix"
	screencapture -x -S -t png "$filename"
	echo "Captured screen at $time. "$filename
	sleep $1
done
fi
exit 0