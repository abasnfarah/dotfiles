#!/bin/bash

INITIAL_WORKING_DIRECTORY=$(pwd)

# Arch Linux Package Installation 
packages=(
    anki
    curl
    discord 
    docker
    emacs 
    expressvpn 
    fzf 
    git 
    gnome-keyring
    go
    google-chrome 
    grep
    gzip 
    imagemagick
    iwd
    maven
    mpv
    neofetch 
    nerd-fonts-complete 
    nodejs 
    npm 
    ntp
    nvm
    openssh 
    obs-studio
    python3 
    sed 
    slack-desktop
    smplayer
    spotify
    stow 
    termite
    termite-terminfo
    the_silver_searcher
    tree 
    tree 
    tmux
    unzip 
    vim
    wget
    xclip 
    xwd
    yarn 
    zip 
    zoom
    zsh 
    zsh-syntax-highlighting 
    zsh-theme-powerlevel10k-git 
)

function install_yay {
    pacman -Syu --needed git base-devel 
    cd $HOME
    git clone  https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd $HOME
    rm -rf yay 
    cd $INITIAL_WORKING_DIRECTORY
} 

function install_packages {
cat << EOF 

Installing Arch packages using yay

You can view the list of packages here:

    https://github.com/abasnfarah/dotfiles/blob/main/arch.sh

EOF

    install_yay

    yay -Syu

    for i in "${packages[@]}"; do
        yay -S $i
    done

}

function display_packages {
    echo "${packages[@]}" | sed 's/ /\n --/g'
}
