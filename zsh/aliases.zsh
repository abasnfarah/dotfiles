export EDITOR='vim'

###############################################################################
# Bookmarks
###############################################################################

# Bookmarks
alias @dw='~/Downloads'
alias @wp='~/workspaces'
alias @dt='~/workspaces/dotfiles'

###############################################################################
# Basic Aliases
###############################################################################

# Tmux set up
alias tmux="TERM=screen-256color tmux -2"

alias v="vim"
alias e="emacs"
alias t="touch"
alias d="docker"
alias dc="docker-compose"
alias y="yarn"
alias md="mkdir"
alias rd="rm -rf"
alias q="exit"
alias c="clear"

#alias och="open -a /Applications/Google\ Chrome.app"

alias prof="v ~/.zshrc"
alias lprof="v ~/.local.zsh"
alias aprof="v ~/.aliases.zsh"
alias reprof="c && source ~/.zshrc"

alias tree="tree -a -I '.git*'"
alias vprof="v ~/.vimrc"
alias tprof="v ~/.tmux.conf"  
alias gpd="git push origin --delete "
alias wp=" cd ~/workspaces"
alias p3="python3"

# tmux aliases
alias ts="tmux new -s"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tkill="tmux kill-server"

# C++ C Java Compiling and running
alias jc="javac"
alias j="java"
alias gcpp="g++ -std=c++11"

###############################################################################
# Arch Specific Commands
###############################################################################

#alias terprof="v ~/.config/termite/config"
#alias rcprof="v ~/.config/awesome/rc.lua"
#alias xprof="v ~/.xinitrc"

# mimics pbcopy on macosx using xclip in Arch Linux 
# Requirements: xclip
#alias pbcopy="xclip -selection clipboard"
#alias pbpaste="xclip -selection clipboard -o"

# Package manager aliases
#alias pacupg="sudo pacman -Syu"
#alias pacin="sudo pacman -S"
#alias yayupg="yay -Syu"
#alias yain="yay -S"

#alias och="google-chrome-stable"

# Screenshot alias using xorg-xwd
#alias screenshot="xwd -frame -out screenshot.xwd"

###############################################################################
# Build Tool Aliases
###############################################################################

# GoLang Compiling and runing
alias gor="go run"
alias gob="go build"

# Bazel aliases 
alias br="bazel run"
alias bce="bazel clean -expunge"
alias brg="bazel run //:gazelle"

# Maven aliases
alias mc="mvn clean"
alias mej="mvn package exec:java"

# npm aliases
alias ns="npm start"
alias nrb="npm run build"
alias nrd="npm run deploy"

###############################################################################
# Github Aliases
###############################################################################

# git aliases
alias gcl="git clone --recurse-submodules"
alias gd="git diff"
alias gp="git push"
alias gpf="git push -f"
alias gl="git pull"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit" 
#alias gcmsg="git commit -m"
alias gcmsg="git commit -S -m" # This is a signed commit aliases
alias gcam="git commit --amend"
alias gst="git status"
alias gb="git branch"
alias gbD="git branch -D"
alias gco="git checkout"
alias glo="git log --oneline --decorate"
alias glg="git log"
alias gr="git remote"
alias grv="git remote -v"
alias gcf="git config"
alias gcfl="git config -l"
alias grb="git rebase"
alias au="git unadd"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gm="git merge"
alias grs="git restore"

git-re-master() {
  git checkout master && git fetch upstream && git pull upstream master
}
git-re-rebase() {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD) && git-re-master && git checkout $CURRENT_BRANCH && git rebase master
}

###############################################################################
# Directory aliases - Requires autocd to work
###############################################################################

#directory related
alias ls='ls -G'          # ls with color
alias ll='ls -1A'         # list directory
alias l='ls -lah'         # list directory with additional information
alias -g ..='..'          # move up by one directory
alias -g ...='../..'      # move up by two directories
alias -g ....='../../..'  # move up by three directories



