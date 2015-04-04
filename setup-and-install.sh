#!/bin/sh
#a
# Tells the shell script to exit if it encounters an error
set -e

source log.sh

msg "\n"
msg "$(cat .art/dotfiles.txt)"
msg "\n"


sg_run "Installing Apps"
