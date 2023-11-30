# My Dotfiles Project

A never ending project..

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

![Image of dotfiles](dotfiles.png)

If you are new to dotfiles see https://dotfiles.github.io/, when you search GitHub for [dotfiles](https://github.com/search?q=dotfiles), you will see there are over 180k repositories after one goal: Store user’s dotfiles in a shareable and repeatable manor.

I am using Ansible to configure my local development machine and manage my dot files, such as:

- shell aliases, environments
- homebrew packages
- various configs for MacOS, vim, git, ansible, tmux and zsh/bash
- etc ...

There many are other general-purpose [dotfiles utilities](https://dotfiles.github.io/utilities/) that seem to be more popular.

The reason I am utilizing Ansible is that it is my preferred tool for managing my dotfiles. Other tools were not as mature or popular when I first began version controlling my dotfiles. As an agent-less configuration management tool, Ansible appears to be a suitable solution for my needs:

- There is no agent constantly running and consuming resources
- Ansible provides greater power and control when implementing updates. Typically, I prefer to manually test and evaluate the changes before incorporating them into the version controlled configuration management system
- Creating custom installation scripts in languages such as Bash or other programming languages can be a flexible solution, but it comes at the cost of investing more time in developing a personalized approach

## Requirements

### Install Homebrew

:warning: Replace `/opt/homebrew/` by `/home/linuxbrew/.linuxbrew` if it's different in Linux

```bash
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to your PATH in /Users/$USER/.zprofile or /Users/$USER/.profile (if bash)
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# https://docs.brew.sh/Analytics#opting-out
export HOMEBREW_NO_ANALYTICS=1
brew analytics off
```

### Install Keybase

```bash
brew install --cask keybase
brew install gnupg
```

:warning: If you get an error like `kbfuse.fs can't be opened because apple cannot check it for malicious software`,
right click on Keybase Application and click open, if you are still having issues follow the bellow steps:

- https://iboysoft.com/howto/enable-system-extension-m1-mac.html#
  > 1. Shut down your Mac and press the Touch ID button and then quickly hold it downs until it says "Loading up startup options".
  > 2. Click Options and then click Continue to boot the M1 Mac to macOS Recovery Mode.
  > 3. Select Startup Security Utility from the Utilities menu.
  > 4. When you see the startup disk, click it and click on Security Policy...
  > 5. In Startup Security Utility, choose Reduced Security and check the option: Allow user management of kernel extensions from identified developers.

Install MacFuse so Keybase can work with Finder, FUSE extends macOS by adding support for user space file systems.

```bash
brew install macfuse
```

### Install Git

```bash
xcode-select --install
brew install git
mkdir -p ~/src/nicolas-g/
cd ~/src/nicolas-g/
git clone --depth 1 https://github.com/nicolas-g/dotfiles.git
cd ~/src/nicolas-g/dotfiles
```

### Install [password-store](https://www.passwordstore.org/)

```bash
brew install pass
```

list keys from kybase and gpg

```
keybase pgp list

# list public keys
gpg -K

# list private keys
gpg -k


# import all keys form keybase to gpg locally
keybase pgp pull-private --all
```

In case of error other things that could help

```
brew install gnupg pinentry-mac
echo "pinentry-program $HOMEBREW_PREFIX/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf

echo "batch" >> ~/.gnupg/gpg.conf
restart the laptop
```

Clone an existing repo from Keybase locally
NOTE: Replace keybase_user_id !!!

```
git clone keybase://private/${keybase_user_id}/password-store ~/.password-store
```

test passwordstore is working

```
pass {{ path_to_password_store }}
```

### Install Python

```bash
brew install pyenv
brew install pyenv-virtualenv
pyenv install 3.10:latest
#or
pyenv install -s 3.10.4

pyenv global 3.10.4

pyenv global global
pyenv global 3.10.4

cd ~/src/nicolas-g/dotfiles
pyenv virtualenv 3.10.4 dotfiles
pyenv local dotfiles

# Add pyenv initializer to shell startup script
echo 'eval "$(pyenv init --path)"' >> ~/.zprofile

# Reload your profile
source ~/.zprofile

pip3 install --upgrade pip
pip3 install virtualenv
brew link pyenv

# ?? arch: posix_spawnp: pyenv: Bad CPU type in executable
arch -x86_64 pyenv install -s 3.10.4

cd ~/src/nicolas-g/dotfiles
pip install -r requirements.txt
```

### Install Python on Linux

```bash
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get -y install build-essential libssl-dev libffi-dev python-dev
sudo apt install python3-pip
sudo pip3 -y install virtualenv
```

### Install Ansible

```bash
vi ~/src/nicolas-g/dotfiles/my_vars.yaml
```

If python/pyenv hast not been setup in previous step

```bash
mkdir -p ~/venv
virtualenv -p python3 ~/venv/ansible
source ~/venv/ansible/bin/activate
pip install -r requirements.txt
```

```bash
ansible-galaxy collection install -r requirements.yml -f
ansible-playbook ${playbook}.yml -D -v -e install_packages=true
```

See [manual_config_steps.md]
