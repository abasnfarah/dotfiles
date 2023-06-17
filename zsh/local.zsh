eval export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
export XC32_LIBRARY_PATH="/Applications/microchip/xc32/v4.21/lib"
# Go Enviroment/Path
# ZSH_DISABLE_COMPFIX=true
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
#export GOROOT=/usr/lib/go/bin/go
#export GOROOT=/usr/local/go
#export GOROOT=/usr/bin/go
export GOBIN=$GOPATH/bin
#export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN
export PATH=$PATH:$GOPATH:$GOBIN
export TERM="screen-256color"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Uncomment the following line for a transparent terminal in arch
#compton -cb
{ eval "$(ssh-agent -s)"; ssh-add -q ~/.ssh/id_rsa; ssh-add -q ~/.ssh/id_rsa_umn; } &>/dev/null
neofetch

# Uncomment the following line to map caps lock to escape for arch linux
#setxkbmap -option caps:escape &>/dev/null

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

# Uncomment the follwing line to match lowercase letters to uppercase letters for tab completion and vice versa
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

function StarWars {
    echo "Are you ready for some StarWars Brahh" && archey && sleep 2 && tree ~ && telnet towel.blinkenlights.nl 
}

# Easy way to check for command_existing in shell scripts
command_exists () {
  command -v "$1" >/dev/null 2>&1
}
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
