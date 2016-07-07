#!/bin/sh

printf "\n************\nSetting up dev\n"

function prompt {
  choice=false
  while true; do
    read -p "y/n? " yn
    case $yn in
      [Yy]* ) choice=true
              break;;
      [Nn]* ) break;;
      * ) echo "y/n? ";;
    esac
  done
}

# Install Homebrew or update
which -s brew
if [[ $? != 0 ]] ; then
    printf "\nDo you want to install Homebrew?\n"
    prompt
    install_brew=$choice
    if [ $install_brew == true ]; then
        printf "Installing homebrew\n"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        printf "\n*****\n\n"
    fi
else
    printf "\nHomebrew is installed, do you wish to update?\n"
    prompt
    update_brew=$choice
    if [ $update_brew == true ]; then
        brew update -v
    fi
fi

# Install rvm or update
which -s rvm
if [[ $? != 0 ]] ; then
    printf "\nDo you want to install RVM?\n"
    prompt
    install_rvm=$choice
    if [ $install_rvm == true ]; then
        printf "Installing rvm\n"
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
        curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.0 --gems=bundler,pry --ignore-dotfiles
        source $HOME/.rvm/scripts/rvm
        printf "\n*****\n\n"
    fi
else
    printf "\nRVM is installed, do you wish to update?\n"
    prompt
    update_rvm=$choice
    if [ $update_rvm == true ]; then
        rvm get stable
        printf "\n*****\n\n"
    fi
fi

which -s brew
if [[ $? = 0 ]]; then
    printf "\nDo you want to install Homebrew packages?\n"
    prompt
    install_pkgs=$choice
    if [ $install_pkgs == true ]; then
        brew update
        brew tap homebrew/bundle
        brew bundle
    fi
fi

which -s rcup
if [[ $? = 0 ]]; then
    printf "\nLink dotfiles with rcm?\n"
    prompt
    link_dots=$choice
    if [ $link_dots == true ]; then
        printf "\nLinking dotfiles with rcm.\n"
        RCRC=rcrc rcup -v
        # make bin files executable
        chmod -R +x "$( cd -P $( dirname $BASH_SOURCE ) && pwd )/bin"
    fi
fi

printf "\nInstall Vim Packages?\n"
prompt
install_vim_stuff=$choice
if [ $install_vim_stuff == true ]; then
    mkdir -p "$HOME/.vim/bundle"
    vim +PlugInstall +qa
fi

printf "\nAdd System Settings for OSX?\n(You might really want to read these first)\n"
prompt
sys_sets=$choice
if [ $sys_sets == true ]; then
    source system/osx-settings
fi

source "$HOME/.profile"

printf "\nSetup complete\n\n************\n\n"