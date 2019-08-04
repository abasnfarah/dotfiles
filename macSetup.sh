echo "Starting bootstrapping"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#Updating Brew
brew update

brew install bash zsh

packages=(
	git
	npm
	python3
	vim
	wget
	curl
	tree
	tmux
	ssh-copy-id
	screenfetch
	archey
)

echo "Installing packages..."
brew install ${packages[@]}

echo "Cleaning up"
brew cleanup

CASKS=(
	google-chrome
	google-drive
	flux
	iterm2
	virtualbox
	skype
	sublime
	disk-inventory-x
)

echo "Installing Cask apps..."
brew cask install ${CASKS[@]}

echo "Installing Oh-My-Zsh..."
#Installing Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

echo "Updating dotfiles..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim



