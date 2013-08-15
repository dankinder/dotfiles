#!/bin/bash
####################
# install.sh
# Symlinks the dotfiles in dotfiles/src/ from ~
####################

repo_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for dotfile in $(ls -A $repo_dir/src); do
  if [ -h ~/$dotfile ]; then
    # If a dotfile symlink already exists, just delete and we'll recreate it
    rm ~/$dotfile
    echo "Deleted symlink ~/$dotfile"
  elif [ -e ~/$dotfile ]; then
    # If it's a real file or directory, back it up
    mv ~/$dotfile $repo_dir/backups
    echo "Moved ~/$dotfile to $repo_dir/backups"
  fi
  ln -s $repo_dir/src/$dotfile ~/$dotfile
  echo "Linked ~/$dotfile -> $repo_dir/src/$dotfile"
done
