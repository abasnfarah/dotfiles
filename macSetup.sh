#!/bin/bash

echo "Starting bootstrapping.."
sleep .5
echo "..."
sleep .5

set -e

# Flag to only install dotfiles and not packages
only_install_dotfiles="${1}"

my_os="$(uname -s)"
my_distro="none"

command_exists () {
  command -v "$1" >/dev/null 2>&1
}

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


case "$(my_os)" in 
    Darwin*) my_os="macOS" && my_distro="macOS";;
    Linux*) 
        my_os="Linux"
        
        if [ -f "/etc/arch-release" ]; then
            my_distro="arch"
        else
            if  [ -f "/etc/debian_version" ]; then
                my_distro="ubuntu"
            else
                [ -z "${only_install_dotfiles}" ] && no_packages
            fi
        fi

    *)
        my_os="Other"
        [ -z "${only_install_dotfiles}" ] && no_packages
        
        ;;
esac

###############################################################################
# TODO: Install packages using OS or distro package manager
###############################################################################



# Check for Homebrew, install if we don't have it
if command_exits brew; then
    echo "Installing homebrew..."
    sleep .5
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

./brew.sh

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

 
