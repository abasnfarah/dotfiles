export EDITOR='nvim'

###############################################################################
# Bookmarks
###############################################################################

# Bookmarks
alias @p='~/workspaces/CSCI_4131'
alias @dw='~/Downloads'
alias @wp='~/workspaces'
alias @dt='~/workspaces/dotfiles'
alias @w="~/workspaces/workload"
alias @cp='~/workspaces/competativeProgramming'
alias @af='~/workspaces/abasfarah.io'
alias @tmr='~/.tmux/resurrect/'
alias @n='~/.config/nvim/'
alias @db='~/workspaces/CSCI_5451/'
alias @ra='~/workspaces/Tennis-Self-Serve'

###############################################################################
# Basic Aliases
###############################################################################

alias v="nvim"
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
alias vim="vim"
>>>>>>> Stashed changes
=======
alias vim="vim"
>>>>>>> Stashed changes
alias e="emacs"
alias t="touch"
alias y="yarn"
alias md="mkdir"
alias rd="rm -rf"
alias q="exit"
alias c="clear"
alias h="history"
alias w="which" 
alias hgrep="fc -El 0 | grep"
alias fd="find . -type d -name"
alias ff="find . -type f -name"

# config files
alias prof="v ~/.zshrc"
alias eprof="v ~/.config/emacs/early-init.el"
alias lprof="v ~/.local.zsh"
alias aprof="v ~/.aliases.zsh"
alias reprof="c && source ~/.zshrc"
<<<<<<< Updated upstream
=======

alias tree="tree -a -I '.git*|node_modules'"
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
alias vprof="v ~/.vimrc"
alias tprof="v ~/.tmux.conf"  

alias tree="tree -a -I '.git*|node_modules'"
alias gpd="git push origin --delete "
alias wp=" cd ~/workspaces"
alias py="python"
alias p3="python3"

# tmux aliases
# alias tmux="TERM=screen-256color tmux -2 -u"
alias tmux="TERM=xterm-256color tmux"
alias ts="tmux new -s"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tkill="tmux kill-server"
function tmux_restore {
    ln -sf ~/.tmux/resurrect/"$1.txt" ~/.tmux/resurrect/last
    tmux
}

# C++ C Java Compiling and running
alias jc="javac"
alias j="java"
alias gcpp="g++-11 -std=c++11 -Wall"

###############################################################################
# Arch Specific Commands - uncomment if you are using Arch Linux
###############################################################################

# alias terprof="v ~/.config/termite/config"
# alias rcprof="v ~/.config/awesome/rc.lua"
# alias xprof="v ~/.xinitrc"
#
# # Mimics pbcopy on macosx using xclip in Arch Linux 
# # Requirements: xclip
# alias pbcopy="xclip -selection clipboard"
# alias pbpaste="xclip -selection clipboard -o"
#
# # Package manager aliases
# alias pacupg="sudo pacman -Syu"
# alias pacin="sudo pacman -S"
# alias parupg="paru -Syu"
# alias parui="paru -S"
#
# alias och="google-chrome-stable"
#
# # Screenshot alias using xorg-xwd
# alias screenshot="xwd -frame -out screenshot.xwd"

###############################################################################
# Build Tool Aliases
###############################################################################

# GoLang Compiling and runing
alias gor="go run"
alias gob="go build"
alias got="go test ./..."

# Docker aliases
#alias d="docker"
#alias dc="docker-compose"
#alias db="docker build"
#alias dr="docker run"
#alias de="docker exec"
#alias ds="docker stop"
#alias dlo="docker logs"
#alias dps="docker ps"
#alias dimg="docker image"
#alias dimgl="docker image list"
#alias dsp="docker system prune"

#Kubernetes aliases
#alias kv="kubectl version"
#alias kg="kubectl get"
#alias kapi="kubectl apiversions"
#alias kgp="kubectl get pod"
#alias kgd="kubectl get deployment"
#alias kgcrd="kubectl get crd"
#alias kgn="kubectl get namespace"
#alias kd="kubectl delete"
#alias kdp="kubectl delete pods"
#alias kdd="kubectl delete deployment"
#alias kdn="kubectl delete namespace"
#alias kaf="kubectl apply -f"

# Bazel aliases 
<<<<<<< Updated upstream
#alias bar="bazel run"
#alias bab="bazel build'"
#alias bac="bazel clean"
#alias brg="bazel run //:gazelle"
=======
alias bar="bazel run"
alias bab="bazel build'"
alias bac="bazel clean"
alias brg="bazel run //:gazelle"
# alias bat="bazel test"
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

# Maven aliases
#alias mc="mvn clean"
#alias mej="mvn package exec:java"

# npm aliases
#alias ns="npm start"
#alias nrb="npm run build"
#alias nrd="npm run deploy"

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
alias ll='ls -1A'         # lists files/directories
alias l='ls -lah'         # lists files/directories with additional information
alias ldot="ls -ld .*"    # lists all dotfiles in a long list
alias lS="ls -1FSsh"      # Lists files with name and size sorted by size
alias -g ..='..'          # move up by one directory
alias -g ...='../..'      # move up by two directories
alias -g ....='../../..'  # move up by three directories
