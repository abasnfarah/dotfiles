#!/bin/bash

# Brew and macOS packages installation

packages="bash zsh neofetch tree zsh-syntax-highlighting npm mvn yarn go python3"

CASKS=(
    adobe-creative-cloud
    alfred
    anki
    binance
    discord
    disk-inventory-x
    docker
    expressvpn
    firefox
    google-chrome
    intellij-idea-ce
    iterm2
    kindle
    lastpass
    minecraft
    notion
    obs
    postman
    postico
    slack
    spotify
    steam
    tor-browser
    virtualbox
    visual-studio-code
    vlc
    zoom
)

function brew_install {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function install_packages {
cat << EOF 

Installing macOS packages using Brew

You can view the list of packages here:

    https://github.com/abasnfarah/dotfiles/blob/main/brew.sh

EOF
    sleep .5


    [ -x "$(command -v brew > /dev/null 2>&1)" ] && brew_install

    brew install ${packages}
}


function install_casks {
cat << EOF
Installing macOS casks using Brew

You can view the list of packages here:
    
    https://github.com/abasnfarah/dotfiles/blob/main/brew.sh

EOF
    sleep .5

    echo "Installing Nerd Fonts"
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font

    echo "Installing Cask apps..."
    brew install --cask ${CASKS[@]}

    echo "Cleaning up"
    brew cleanup
}

function display_packages {
    echo "${packages}"
}

function display_casks {
    echo "${CASKS}"
}

cat << EOF
Preparing to install brew packages

Choosing yes will install all of the following brew packages

${display_packages}

If you don't want to install all of the following packages you can 
edit the install script to omit or add additional packages.

EOF

while true; do
    read -rp "Do you want to install the listed packages? (y/n) " yn 
    case "${yn}" in
        [Yy]*)
            install_packages 
            break;;
        [Nn]*) exit 0;;
        *) echo "Invalid Input. Please respond with y (yes) or n (no)";;
    esac
done


cat << EOF
Preparing to install brew casks

Choosing yes will install all of the following brew casks

${display_casks}

If you don't want to install all of the following casks you can 
edit the install script to omit or add additional casks.

EOF

while true; do
    read -rp "Do you want to install the listed packages? (y/n) " yn 
    case "${yn}" in
        [Yy]*)
            install_casks
            break;;
        [Nn]*) exit 0;;
        *) echo "Invalid Input. Please respond with y (yes) or n (no)";;
    esac
done





