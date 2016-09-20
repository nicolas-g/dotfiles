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

brew install git
brew install wget
brew install tree

brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install spotify
brew cask install virtualbox
brew cask install vlc

# worth create aliases 
## Update App Store apps
sudo softwareupdate -i -a

## Update Homebrew (Cask) & packages
brew update
brew upgrade


TODO: 
=====
Script to create crontab :
```
0 13 * 2 * /usr/local/bin/brew list > ~/.dotfiles/brew_list.txt
```

brew install macvim --override-system-vim
