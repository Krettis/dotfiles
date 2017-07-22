#!/usr/bin/env bash

source $DOTFILE_DIRECTORY/log.sh

sync_parent_dir=

function sync_file()
{
  local file_name="$1"
  local target_file="$2"

  has_diff=`cmp "$file_name" "${target_file}"`
  if [[ ! -z $has_diff ]]; then
    if [[ ! -z $sync_parent_dir ]]; then
      msg_prompt "Directory : $sync_parent_dir\n  ======\n"
      sync_parent_dir=
    fi
    msg_warning "$file_name has changed" "\n"

    read -p "Show diff?`echo $'\n> '`" -n 1
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      git diff --color "$file_name" "$target_file"

      read -p "sync file?`echo $'\n> '`" -n 1
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo ""
        rsync "$target_file" "$file_name"
        #echo "ok:: $file_name -> $target_file"
      fi
    fi
  fi
}

function from_dir_to_file()
{
  local file="$1"

  if [ -d "${DOTFILE_DIRECTORY}/dots/$file" ]; then

    local dir_path="dots/${file}*"
    local dir_path=$(shopt -s nullglob;shopt -s dotglob;echo ${DOTFILE_DIRECTORY}/dots/${file}*)
    sync_parent_dir="$file"

    for f in ${dir_path}
    do
      if [[ "${f: -1}" == "*" ]]; then
        return
      fi

      #echo "f::{${f/${DOTFILE_DIRECTORY}\/dots\//}"
      from_dir_to_file "${f/${DOTFILE_DIRECTORY}\/dots\/}/" "$file"
    done
  else
    local _file=${file%/}
    sync_file "${DOTFILE_DIRECTORY}/dots/$_file" "${HOME}/${_file}"
  fi

}


#.art/ \
#.gdbinit \
#.gitattributes \
#.gvimrc \
#.hgignore \
#.hushlogin \
#.osx \
#.osxconfig/ \
#.tmux.conf \

for file in \
.appscripts/ \
.bash/ \
.bashrc \
.composer/composer.json \
.composer/config.json \
.docker/config.json \
.curlrc \
.editorconfig \
.gitconfig \
.gitignore \
.inputrc \
.screenrc \
.tmux.conf \
.vim/ \
.vimrc \
.wgetrc \
; do

dot_file="${DOTFILE_DIRECTORY}/dots/$file"

if [ ! -f "$dot_file" ] && [ ! -d "$dot_file" ]; then
  msg_error "${dot_file} does not exists"
  continue
fi

from_dir_to_file "$file"
done

### Auto commit it to repo
dotgit="git --git-dir=$DOTFILE_DIRECTORY/.git --work-tree=$DOTFILE_DIRECTORY"
$dotgit add dots/
if [[ ! -z `$dotgit diff --cached` ]]; then
  $dotgit commit -m"Autocommit: SYNC dot files"
  $dotgit push
fi


#EOF
