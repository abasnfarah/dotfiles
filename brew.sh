#!/bin/bash

# Brew and macOS packages installation

packages=(
    ag
    bash 
    ccls
    coreutils
    fzf 
    git 
    go 
    gpg
    mvn 
    neofetch 
    npm 
    python3 
    romkatv/powerlevel10k/powerlevel10k
    tmux
    tree 
    yarn 
    zsh 
    zsh-syntax-highlighting 
)

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

    if [ ! -x "$(command -v brew)" ]; then 
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    for i in "${packages[@]}"; do
        brew install $i
    done

}


function install_casks {
cat << EOF
Installing macOS casks using Brew

You can view the list of packages here:
    
    https://github.com/abasnfarah/dotfiles/blob/main/brew.sh

EOF

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
    echo "${packages[@]}" | sed 's/ /\n --/g'
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





