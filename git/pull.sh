#!/usr/bin/env bash

current_branch=$(git rev-parse --abbrev-ref HEAD)

git pull origin "$current_branch"