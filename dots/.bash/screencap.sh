#!/usr/bin/env bash

# Creates a directory on the desktop called screens and takes
# screenshots of the display at regular intervals and saves the
# results in screens.
# screenshot 2014-09-01 om 19.45.41

function capture_screen
{
  local seconds="$1"
  local cap_dir="$HOME/uri/screenshots/caps"
  mkdir -p "$cap_dir"
  local prefix="$cap_dir/screenshot "
  local suffix=".png"
  local file_name=

  while true; do
    time=$(date +%Y-%m-%d" at "%H.%M.%S)
    file_name="${prefix}${time}${suffix}"
    screencapture -x -S -t png "$file_name"
    echo "Captured screen at $time. "$file_name
    sleep $seconds
  done
}

if [ ! -z "$1" ]; then
  total_seconds="$1"
  if [ ! -z "$2" ]; then
    total_seconds=$(($1 * 60))
  fi
  capture_screen "$total_seconds"
else
  echo "Usage: screencap.sh [seconds|minutes] [m]"
fi