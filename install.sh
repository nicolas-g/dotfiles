#!/usr/bin/env bash

set -e

DOTFILES_URL='https://github.com/nicolas-g/.dotfiles.git'
DOTFILES_DEST=$HOME/.dotfiles

main()
{
  echo -e "\nStart dotfiles.."
  clone_dotfiles
  install_dot_pkgs
  continue_with_dot_config
}


clone_dotfiles()
{
    echo -e "\n\nSetting up the dotfiles repo."

    if [ ! -d $DOTFILES_DEST ]; then

      echo -e "\nCloning $DOTFILES_URL into $DOTFILES_DEST..."
      cd
      git clone $DOTFILES_URL $DOTFILES_DEST
      cd $DOTFILES_DEST

      #echo -e "Initializing submodule(s)"
      #git submodule $verbosity init --recursive
      #git submodule $verbosity update

    else
      echo -e "\nExisting dotfiles found in $DOTFILES_DEST."
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
    echo -e "\nThis is not a supported platform.."
    exit 1;
  fi
  
}

continue_with_dot_config()
{
  echo -e "\n\nContinue with dot config"
  #source install/backup.sh
  source install/link.sh

  echo -e "\n\nSet zsh as the default shell"
  chsh -s $(which zsh)
}

main
echo -e "\n\ndotfiles done!"
