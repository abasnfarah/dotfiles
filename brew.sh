# Brew Installation

#Updating Brew
brew update

brew install bash
brew install zsh
brew install neofetch
brew install tree

packages=(
	git
	npm
	python3
	vim
	wget
	curl
	tmux
    zsh-syntax-highlighting
    nodejs
    npm
    mvn
)

echo "Installing packages..."
brew install ${packages[@]}

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
	sublime-text
	disk-inventory-x
    spotify
    virtualbox
    discord
)

echo "Installing Cask apps..."
brew cask install ${CASKS[@]}


