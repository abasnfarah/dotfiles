#Dev Setup

# Vim configuration  
My vim config uses Vundle
To config vim like mine run this vimConfig.sh on your mac or linux machine
###Requirements 
1. vim
To install vim on arch run 
`sudo pacman -S vim`
or install to install on mac using [homebrew](https://brew.sh/)
`brew install vim`
####Screenshot of vim setup

to run enter `. ~/dotfiles/vimconfig.sh` on your console.

What this accomplishes:

| Installed | Reason                                      | Code Run                                                                       |
|:---------:|:-------------------------------------------:|:------------------------------------------------------------------------------:|
|Vundle     |Themes and useful vim tools such as NERDTree.|`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`| 
  
#Zsh configuration
My zsh config uses oh-my-zsh themes and built in commands namely for git and tmux

###Requirements:
1. zsh, git, curl and wget
To install on arch run
`sudo pacman -S zsh wget curl git`
to install on mac using [homebrew](https://brew.sh/) run 
`brew install zsh curl wget`
2. mac or arch linux machine
3. Change primary shell to zsh
To change primary shell to zsh run
`chsh -s $(which zsh)`

####ScreenShot of zsh setup

To run enter `. ~/dotfiles/zshconfig.sh` on your console 

What this accomplishes:
| Installed                                            | Reason                                      | Code Run                                                                                               |
|:----------------------------------------------------:|:-------------------------------------------:|:------------------------------------------------------------------------------------------------------:|
|[Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)|This adds many useful zsh themes.            |`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`|
|Tmux                                                  |This gives more tabbing power to the console |`cp ~/dotfiles/tmux/.tmux.config ~/.tmux.config`                                                        |

This is the primary way to install vim and zsh dotfiles. 
This repository hosts many other dotfiles config files but those are the main ones.  
Feel free to copy my dotfiles or change them to match your own personal setup. 

Thanks ;) 
Abas Farah
