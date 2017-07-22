#!/bin/sh
# Tells the shell script to exit if it encounters an error
set -e

source log.sh

msg "\n"
msg "$(cat .art/dotfiles.txt)"

for file in \
.apps \
.gems \
.npm-install \
.repositories \
; do

  echo $file

done

