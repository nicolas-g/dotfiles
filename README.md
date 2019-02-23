DRAFT
-----

A never ending project..

## Required Manual steps
```
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update

# Install python
brew install python

# Install virtualenv
pip3 install virtualenv

# Crete virtualenv project folder
mkdir ~/venv
virtualenv ~/venv/ansible
source ~/venv/ansible/bin/activate

# Create source projects folder
mkdir ~/src
cd ~/src

# Clone this repo
git clone https://github.com/nicolas-g/dotfiles
cd dotfiles

# Install requirements
pip install -r requirements

Ansible playbook to setup my machine and manage my dot files.
=============================================================
* shell aliases, environments
* homebrew packages
* various configs for MacOS, vim, git, ansible, tmux and zsh/bash

```
roles/workstation
├── files
│   ├── ansible.cfg
│   ├── bashrc
│   ├── env
│   └── vimrc
├── tasks
│   ├── ansible_conf.yml
│   ├── configs.yml
│   ├── main.yml
│   ├── osx_wallpaper.yml
│   └── packages.yml
├── templates
│   ├── aliases.j2
│   ├── gitconfig.j2
│   ├── tmux.conf
│   └── zshrc.j2
└── vars
    ├── main.yml
```

## TBD

#### Update App Store apps
sudo softwareupdate -i -a

TODO:
=====

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
