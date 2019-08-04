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
	flux
	iterm2
	virtualbox
	skype
	sublime-text
	disk-inventory-x
)

echo "Installing Cask apps..."
brew cask install ${CASKS[@]}

echo "Installing Oh-My-Zsh..."
#Installing Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

echo "Updating dotfiles..."
echo "Installing vim dotfiles..."
cp vim/mac.vimrc ~/.vimrc

echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing vim Plugins"
vim +PluginInstall +qall

echo "Installing zsh dotfiles..."
cp zsh/mac.zshrc ~/.zshrc
sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
 
chsh -s $(which zsh)
