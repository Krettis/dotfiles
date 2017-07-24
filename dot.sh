#!/usr/bin/env bash

if [ -z "$1" ]; then
  cd $DOTFILE_DIRECTORY
  ls -al
elif [ "$1" == "alias" ]; then
  $EDITOR $HOME/.bash/.aliases
  dot sync
elif [ "$1" == "function" ]; then
  $EDITOR $HOME/.bash/.functions
  dot sync
elif [ "$1" == "sync" ]; then
  bash $DOTFILE_DIRECTORY/sync.sh
elif [ "$1" == "push" ]; then
  dotgit="git --git-dir=$DOTFILE_DIRECTORY/.git --work-tree=$DOTFILE_DIRECTORY"
  $dotgit push
elif [ "$1" == "install" ]; then
  bash $DOTFILE_DIRECTORY/install.sh
fi

