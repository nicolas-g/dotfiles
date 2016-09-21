#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

egrep -v "^$|^[[:space:]]*#"  brew_list.txt | while read -r file ; do
   echo "brew install $file"
done

exit 0
