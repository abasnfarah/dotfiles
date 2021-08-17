# Brew and macOS packages installation

packages="bash zsh neofetch tree zsh-syntax-highlighting npm mvn yarn go"

function brew_install {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function install_packages {
cat << EOF 

Installing macOS packages using Brew

You can view the list of packages here

    https://github.com/abasnfarah/dotfiles/blob/master/brew.sh

EOF


    [ -x "$(command -v brew > /dev/null 2>&1)" ] && brew_install

    brew install ${packages}
}

cat << EOF 

Updating Brew

...

EOF
brew update

sleep .5

echo "Installing cask"
brew install ntfs-3g

echo "Cleaning up"
brew cleanup

echo "Downloading fonts"
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
brew cask install google-chrome

CASKS=(
    vlc
	iterm2
	disk-inventory-x
    spotify
    virtualbox
    discord
)

echo "Installing Cask apps..."
brew cask install ${CASKS[@]}


