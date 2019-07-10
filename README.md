Dotfiles & Dev workstation environment setup
============================================
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

touch roles/workstation/vars/secrets.yml
ANSIBLE_VAULT_PASS: "changeme"
PIANOBAR_USER_NAME: "changeme"
PIANOBAR_USER_PASSWORD: "changeme"
```

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

TODO:
=====

use pyenv and pip env ? https://hackernoon.com/reaching-python-development-nirvana-bb5692adf30c

Update App Store apps
```
sudo softwareupdate -i -a
```

check how to use already installed :
* https://github.com/psprint/zsh-navigation-tools
* https://grml.org/zsh/#zshlovers

create virtual_envs (ansible/magic-wormhole ?)

XCode Developer CLI tools are used by various apps that manipulate core OSX features. So make sure to install the Xcode CLI tools by running the following command.
$ xcode-select —-install

gpg encryption (pianobar)

fonts : https://github.com/atomantic/dotfiles/blob/0f1df7b11e12482d955e4f2e0109529325c491c9/install.sh#L238

brew install macvim --override-system-vim

### Kubectl
https://github.com/ahmetb/kubectl-aliases
kube-ps1 is not working (https://github.com/jonmosco/kube-ps1)
kubectl plugin list / https://github.com/kubernetes-sigs/krew


### Tmux
https://github.com/samoshkin/tmux-config
https://github.com/jonmosco/kube-tmux/blob/master/kube.tmux

### Vim
fzf Vim https://github.com/junegunn/fzf.vim


OSX defaults:
https://github.com/mathiasbynens/dotfiles/blob/master/.macos#L415
https://github.com/paulirish/dotfiles/blob/master/.osx#L163
https://github.com/mathiasbynens/dotfiles/blob/master/.macos
https://github.com/atomantic/dotfiles/blob/0f1df7b11e12482d955e4f2e0109529325c491c9/install.sh#L514
https://github.com/mathiasbynens/dotfiles/blob/master/.macos
https://github.com/driesvints/dotfiles/blob/master/.macos



Terraform official script
```
TERRAFORM_LATEST_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M ".current_version")
curl --silent --location https://releases.hashicorp.com/terraform/${TERRAFORM_LATEST_VERSION}/terraform_${TERRAFORM_LATEST_VERSION}_linux_amd64.zip --output /tmp/terraform_linux_amd64.zip
unzip -o /tmp/terraform_linux_amd64.zip -d /usr/local/bin/
```


## Manual post steps

copy zsh_history

git clone git@github.com:Magnetic/NGAnsible.git
git clone git@github.com:Magnetic/NGTerraform.git

set Apple ID finger print :

authy
* use gVoice number
* enable master password

add wroskspaces in Slack  (work,kubernetes)

openvpn config

#### iTerm key for similar ctrl + > move
```
Preferences > Keys (or Preferences > Profiles > Keys)
Click the plus.
move forward one word

option+right
send escape sequence
f
move back one word

option+left
send escape sequence
b
```

#### Manual post tasks
* System Preferences -> Touch ID
* System Preferences -> Desktop & Screen saver -> Screen saver -> Hot Corners
* System Preferences -> Dock : (size,automatically hide and show the dock)
* iTerm2 -> Preferences -> Load preferences from a custom folder or URL
