#!/bin/bash

echo "Starting bootstrapping.."
sleep .5
echo "..."
sleep .5

command_exists () {
  command -v "$1" >/dev/null 2>&1
}

# Check for Homebrew, install if we don't have it
if command_exits brew; then
    echo "Installing homebrew..."
    sleep .5
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

./brew.sh

echo "Installing Oh-My-Zsh..."
#Installing Oh-My-Zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

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

 
