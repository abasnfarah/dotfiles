#!/bin/bash

echo "Starting bootstrapping.."
sleep .5
echo "..."
sleep .5

set -e

# Flag to only install dotfiles and not packages
only_install_dotfiles="${1}"

# This gets the OS of current machine. 
MY_OS="$(uname -s)"

MY_DISTRO="none"

# Current working directory. We'll need to come back to this later
INITIAL_WORKING_DIRECTORY=$(pwd)

# Directory of install script
SCRIPT_DIRECTORY=$(dirname "$0")


###############################################################################
# Find OS and Distro Name
###############################################################################

function no_packages() {
cat << EOF
Can't install packages on this device. 

Package installation is not supported on you OS or Distro

Please install any packages on your own. The list of of packages are located at:
    
    https://github.com/abasnfarah/dotfiles/blob/master/install

To install without packages, re-run the script wiht the following flag
    
    bash <(TODO: add in install link)> --only-install-dotfiles
EOF
    exit 1
}


case "$(MY_OS)" in 
    Darwin*) MY_OS="macOS" && MY_DISTRO="macOS";;
    Linux*) 
        MY_OS="Linux"
        
        if [ -f "/etc/arch-release" ]; then
            MY_DISTRO="arch"
        else
            if  [ -f "/etc/debian_version" ]; then
                MY_DISTRO="ubuntu"
            else
                [ -z "${only_install_dotfiles}" ] && no_packages
            fi
        fi

    *)
        MY_OS="Other"
        [ -z "${only_install_dotfiles}" ] && no_packages
        
        ;;
esac

###############################################################################
# TODO: Install packages using OS or distro package manager
###############################################################################

/bin/bash ./brew.sh

echo "Updating dotfiles..."
echo "Installing vim dotfiles..."
cp vim/mac.vimrc ~/.vimrc

echo "Installing Plug.."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing zsh and tmux dotfiles..."
cp zsh/mac.zshrc ~/.zshrc
cp zsh/mac.aliases ~/.aliases
cp tmux/.tmux.conf ~/.tmux.conf
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

 
