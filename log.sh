#!/bin/sh

##################
# Code # Color   #
##################
#  00  # Off     #
#  30  # Black   #
#  31  # Red     #
#  32  # Green   #
#  33  # Yellow  #
#  34  # Blue    #
#  35  # Magenta #
#  36  # Cyan    #
#  37  # White   #
##################

function msg {
	echo -e  "\033[0;37m$1\033[0m";
}

function msg_ok {
	echo -e  "➜\033[1;32m $1 ✔\033[0m";
}

function msg_error {
	echo -e  "\⃠\033[1;31m $1 \033[0m";
}

function msg_warning {
	echo -e  "${2}⚠\033[1;33m $1 \033[0m";
}

function msg_prompt {
	echo -e "➜\033[1;33m $1 \033[0m";
}

function msg_config {
	echo -e  "➜ \033[1;36m $1 ✔\033[0m";
}

function msg_run {
	echo -e  "➜\033[1;35m $1  $2\033[0m";
}

function msg_done {
	echo -e "➜\033[1;37m $1 \033[0m";
}

