#!/usr/bin/env bash

# Creates a directory on the desktop called screens and takes
# screenshots of the display at regular intervals and saves the
# results in screens.
# Schermafbeelding 2014-09-01 om 19.45.41

if [ ! -z "$1" ]; then
cap_dir="$HOME/uri/screenshots/caps"
mkdir -p "$cap_dir"
prefix="$cap_dir/screenshot "
suffix=".png"
while true; do
	time=$(date +%Y-%m-%d" at "%H.%M.%S)
	filename="$prefix$time$suffix"
	screencapture -x -S -t png "$filename"
	echo "Captured screen at $time. "$filename
	sleep $1
done
fi