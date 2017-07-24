#!/usr/bin/env bash

current_branch=$(git rev-parse --abbrev-ref HEAD)

git_flag=

if [ "$2" == "no-verify" ]; then
  git_flag="--no-verify"
fi

if [ "$1" == "force" ]; then
  git push -f $git_flag origin "$current_branch"
else
  git push $git_flag origin "$current_branch"
fi
