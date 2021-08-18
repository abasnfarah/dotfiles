# Go Enviroment/Path
# ZSH_DISABLE_COMPFIX=true
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN
export TERM="screen-256color"

# Uncomment the following line for a transparent terminal in arch
#compton -cb
{ eval "$(ssh-agent -s)"; ssh-add -q ~/.ssh/id_rsa; ssh-add -q ~/.ssh/id_rsa_umn; } &>/dev/null
neofetch

# Uncomment the following line to map caps lock to escape for arch linux
setxkbmap -option caps:escape &>/dev/null

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to jump to folders without the use of cd
setopt autocd

# Uncomment the following line to have cd function like pushd where previous working directory is added to stack
setopt autopushd

# Uncomment the following line to add tab completion to aliases
setopt complete_aliases

# Tmux set up
alias tmux="TERM=screen-256color tmux -2"
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
