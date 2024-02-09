# Go Enviroment/Path
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH:$GOBIN

# Cuda Enviroment/Path
export CUDA=/opt/cuda/bin/
export PATH=$CUDA:$PATH

# Rust Enviroment/Path
export PATH="$HOME/.cargo/bin:$PATH"

# Doom Emacs Path
# export DOOMPATH=~/.config/emacs/bin
# export DOOMPATH=~/.emacs.d/bin
# export PATH=$PATH:$DOOMPATH

# Uncomment the following line to set terminal colors
export TERM="screen-256color"

# Uncomment the following line to add local opt bin to path
export OPT_LOCAL_BIN="$HOME/opt/usr/local/bin"
export PATH=$PATH:$OPT_LOCAL_BIN

export TMPDIR="$HOME/tmp"

{ eval "$(ssh-agent -s)"; ssh-add -q ~/.ssh/id_rsa; ssh-add -q ~/.ssh/id_rsa_umn; } &>/dev/null

####################
# Main config
####################

# Uncomment the following line to run neofetch on terminal startup
neofetch

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following two lines to sync and set system time
#timedatectl set-timezone America/Chicago
#sudo ntpd -qg

# Uncomment the follwing line to remove terminal beep sounds
setopt nobeep

# Uncomment the following line to jump to folders without the use of cd
setopt autocd

# Uncomment the following line to have cd function like pushd where previous working directory is added to stack
setopt autopushd

# Uncomment the following line to add tab completion to aliases
#setopt complete_aliases

# Uncomment the follwing two lines to add tab completion
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# Uncomment the follwing line to enable vi mode
bindkey -v

# Uncomment the follwing four lines to configure custom zsh history
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=3000
HISTSIZE=2999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# Uncomment the follwing two lines to bind arrow keys to history search
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Uncomment the follwing line to match lowercase letters to uppercase letters for tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Uncomment the follwing line to match lowercase letters to uppercase letters for tab completion and vice versa
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Uncomment the follwing line for case insensitive matching only when no case sensitive matches
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Uncomment the following command to set TMUX colors
#alias tmux="TERM=screen-256color tmux -2"

# terminal games and fun
function telehack(){
    telnet telehack.com
}

# Easy way to check for command_existing in shell scripts
command_exists () {
  command -v "$1" >/dev/null 2>&1
}

####################
# End Main config
####################

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
