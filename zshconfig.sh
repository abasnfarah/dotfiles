# First thing is to install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Then to change to primary zshrc file
mv ~/.zshrc ~/old.zshrc
cp ~/dotfiles/zsh/.zshrc ~/.zshrc

# Then install tmux config file
cp ~/dotfiles/tmux/.tmux.config ~/.tmux.config

# Install powerline and powerline themes
pacman -S powerline powerline-fonts
