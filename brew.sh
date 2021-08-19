#!/bin/bash

# Brew and macOS packages installation

packages="bash git zsh neofetch tree zsh-syntax-highlighting npm mvn yarn go python3 fzf romkatv/powerlevel10k/powerlevel10k"

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


    if [ ! -x "$(command -v brew)" ]; then 
        brew_install
    fi

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

    for i in "${CASKS[@]}"; do
        brew install --cask $i
    done

    echo "Cleaning up"
    brew cleanup
}

function display_packages {
    echo "$packages" | sed 's/ /\n --/g'
}

function display_casks {
    echo "${CASKS[@]}" | sed 's/ /\n --/g'
}

cat << EOF
Preparing to install brew packages

Choosing yes will install all of the following brew packages
EOF

display_packages

cat << EOF

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
EOF

display_casks

cat << EOF

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





