#!/usr/bin/env bash

# Backup files that are provided by the dotfiles into a ~/dotfiles-backup_$(date +%d-%b-%Y) directory

DOTFILES=$HOME/.dotfiles
BACKUP_DIR=$HOME/dotfiles-backup_$(date +%d-%b-%Y)

set -e

if [ ! -d "$BACKUP_DIR" ]; then
  # if $BACKUP_DIR doesn't exist
  echo "Creating backup directory at $BACKUP_DIR"
  mkdir -p $BACKUP_DIR
fi

for file in vimrc gitconfig gitignore zshrc zsh vim
do
    if [ -e ~/.${f} ]; then
        mv ~/.${f} BACKUP_DIR/${f}
    fi
    #ln -sf `pwd`/${f} ~/.${f}
done

linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )

for file in $linkables; do
    filename=".$( basename $file '.symlink' )"
    target="$HOME/$filename"
    if [ ! -L $target ]; then
        echo "backing up $filename"
        cp $target $BACKUP_DIR
    else
        echo -e "$filename does not exist at this location or is a symlink"
    fi
done

files=("$HOME/.config/nvim" "$HOME/.vim" "$HOME/.vimrc")
for filename in "$HOME/.config/nvim" "$HOME/.vim" "$HOME/.vimrc"; do
    if [ ! -L $filename ]; then
        echo "backing up $filename"
        cp -rf $filename $BACKUP_DIR
    else
        echo -e "$filename does not exist at this location or is a symlink"
    fi
done
