#!/usr/bin/env bash

set -e

DOTFILES_URL='https://github.com/nicolas-g/.dotfiles.git'
DOTFILES_DEST=$HOME/.dotfiles

main()
{
  echo "Start dotfiles.."
  clone_dotfiles
  install_dot_pkgs
  continue_with_dot_config
}


clone_dotfiles()
{
    echo 'Setting up the dotfiles repo.'

    if [ ! -d $DOTFILES_DEST ]; then

      echo "Cloning $DOTFILES_URL into $DOTFILES_DEST..."
      cd
      git clone $DOTFILES_URL $DOTFILES_DEST
      cd $DOTFILES_DEST

      #echo "Initializing submodule(s)"
      #git submodule $verbosity init --recursive
      #git submodule $verbosity update

    else
      echo "Existing dotfiles found in $DOTFILES_DEST."
      cd $DOTFILES_DEST
      git pull origin master
    fi
}

install_dot_pkgs()
{

  PLATFORM=`uname -s`
  
  if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nSetup OSX"
    source install/brew.sh
    #source install/osx.sh

  elif [ "$PLATFORM" = "Linux" ]; then
  
    echo -e "\n\nSetup Linux.."
    #cp ~/.dotfiles/linux-crontab ~/dotfiles/crontab.tmp
    #[ -f ~/.local-crontab ] && cat ~/.local-crontab >> ~/dotfiles/crontab.tmp
    #crontab ~/dotfiles/crontab.tmp
    #rm -f ~/dotfiles/crontab.tmp
  
  else
    echo "This is not a supported platform.."
    exit 1;
  fi
  
  echo "Configuring zsh as default shell"
  chsh -s $(which zsh)
}

continue_with_dot_config()
{
  echo "Continue with dot config"
  #source install/backup.sh
  #source install/link.sh
}

main
echo "dotfiles done."
