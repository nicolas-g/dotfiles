#!/bin/sh

DOTFILES_DEST=$HOME/.dotfiles

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

egrep -v "^$|^[[:space:]]*#"  $DOTFILES_DEST/install/brew_list.txt | while read -r package ; do
   brew install $package
done
