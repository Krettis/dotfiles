#!/usr/bin/env bash

if [ -z "$1" ]; then
  cd $DOTFILE_DIRECTORY
elif [ "$1" == "sync" ]; then
  bash $DOTFILE_DIRECTORY/sync.sh
elif [ "$1" == "install" ]; then
  bash $DOTFILE_DIRECTORY/install.sh
fi

