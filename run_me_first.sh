#!/bin/env bash

# Run the bellow script to install Homebrew and setup the python virtual environment so you can run Ansible

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
virtualenv ~/venv/dotfiles
source ~/venv/dotfiles/bin/activate

# Create source projects folder
mkdir ~/src
cd ~/src

# Clone this repo
git clone https://github.com/nicolas-g/dotfiles
cd dotfiles

# Install requirements
pip install -r requirements.txt

brew install lastpass-cli
echo "lpass login {{ USER_NAME }}"
