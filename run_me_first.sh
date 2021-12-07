#!/bin/bash

# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to your PATH in /home/ngeorgakopoulos/.profile:
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/ngeorgakopoulos/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# https://docs.brew.sh/Analytics#opting-out
export HOMEBREW_NO_ANALYTICS=1
brew analytics off

# First check OS.
OS="$(uname)"
if [[ "${OS}" == "Linux" ]]
then
  HOMEBREW_ON_LINUX=1
elif [[ "${OS}" != "Darwin" ]]
  then
    abort "Homebrew is only supported on macOS and Linux."
fi

if [[ -n "${HOMEBREW_ON_LINUX-}" ]]
then
  echo "- Install Linux dependencies if you have sudo access:"
  if [[ -x "$(command -v apt-get)" ]]
  then
   sudo apt-get update
   sudo apt-get install build-essential
   sudo apt-get -y install build-essential libssl-dev libffi-dev python-dev
   sudo apt install python3-pip
   sudo pip3 -y install virtualenv
   mkdir -p ~/venv
   virtualenv -p python3 ~/venv/ansible
   # Step 5: Activate your new Python 3 environment. There are two ways to do this
   source ~/venv/ansible/bin/activate
  fi
fi

mkdir -p ~/src
cd ~/src
git clone -–depth 1 https://github.com/nicolas-g/dotfiles.git
cd dotfiles
pip install -r requirements.txt
ansible-galaxy collection install -r requirements.yml -f
ansible-playbook ubuntu.yml -D -v -e install_packages=true
