A never ending project..

Install
=======

### Config files
~/.bashrc
```
source ~/.dotfiles/bashrc
```

~/.bash_profile
```
if [ -f ~/.bashrc ];
then
    source ~/.bashrc
fi
```

### Symlinks
```
ln -s ~/.dotfiles/ssh/config ~/.ssh/config
```

```
ln -s ~/.dotfiles/git/config ~/.gitconfig
```

Software
========
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions


# worth creating aliases

## Update App Store apps
sudo softwareupdate -i -a

## Update Homebrew (Cask) & packages
brew update
brew upgrade

```
ln -s /Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt /usr/local/bin/veracrypt
```

TODO:
=====
Script to create crontab :
```
0 13 * 2 * /usr/local/bin/brew list > ~/.dotfiles/brew_list.txt
```

XCode Developer CLI tools are used by various apps that manipulate core OSX features. So make sure to install the Xcode CLI tools by running the following command.
$ xcode-select —-install

pianobar config

fonts : https://github.com/atomantic/dotfiles/blob/0f1df7b11e12482d955e4f2e0109529325c491c9/install.sh#L238

brew install macvim --override-system-vim


OSX defaults:
https://github.com/paulirish/dotfiles/blob/master/.osx#L163
https://github.com/mathiasbynens/dotfiles/blob/master/.macos
https://github.com/atomantic/dotfiles/blob/0f1df7b11e12482d955e4f2e0109529325c491c9/install.sh#L514
https://github.com/mathiasbynens/dotfiles/blob/master/.macos
https://github.com/driesvints/dotfiles/blob/master/.macos
