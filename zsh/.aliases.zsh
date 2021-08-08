export EDITOR='vim'

#Bookmarks
alias @wp='~/workspaces'
alias wp='cd ~/workspaces'
alias @dot='~/workspaces/dotfiles'

# Tmux set up
alias tmux='TERM=screen-256color tmux -2'

# Meta Aliases
alias v='vim'
alias e='emacs'
alias t='touch'
alias d='docker'
alias dc='docker-compose'
alias y='yarn'
alias md='mkdir'
alias rd='rm -rf'
alias q='exit'
alias c='clear'

# Chrome shortcut
alias och='open -a /Applications/Google\ Chrome.app'

# Config/rc file shortcuts
alias prof='v ~/.zshrc'
alias eprof='emacs ~/.zshrc'
alias aprof='v ~/.aliases.zsh'
alias lprof='v ~/.local.zsh'
alias vprof='v ~/.vimrc'
alias tprof='v ~/.tmux.conf'  
alias reprof='clear && source ~/.zshrc'
#alias terprof='v ~/.config/termite/config'
#alias rcprof='v ~/.config/awesome/rc.lua'
#alias xprof='v ~/.xinitrc'
alias p3='python3'

alias tree='tree -a -I ".git*"'

#School files
alias ee3115='open ~/Documents/2020_2021_SchoolYear/2021_Spring/EE_3115/Textbooks/SedraAndSmith.pdf'
alias 7ee='open ~/Documents/2020_2021_SchoolYear/2021_Spring/EE_3115/Textbooks/SedraSmith7th.pdf'
alias ee3015='open ~/Documents/2020_2021_SchoolYear/2021_Spring/EE_3015/Textbooks/SignalsAndSystems.pdf'

# tmux aliases
alias ts='tmux new -s'
alias ta='tmux a -t'
alias tls='tmux ls'
alias tkill='tmux kill-server'

# C++ C Java Compiling and running
alias jc='javac'
alias j='java'
alias gcpp='g++ -std=c++11'

# GoLang Compiling and runing
alias gor='go run'
alias gob='go build'
alias gcl='go clean'

# Bazel aliases
alias bzr='bazel run'
alias bzc='bazel clean --expunge'
alias bzrg='bazel run //:gazel'

# Maven aliases
alias mc='mvn clean'
alias mej='mvn package exec:java'

# npm aliases
alias ns='npm start'
alias nrb='npm run build'
alias nrd='npm run deploy'

# git aliases
alias gcl='git clone --recurse-submodules'
alias gd='git diff'
alias gp='git push'
alias gpf='git push -f'
alias gl='git pull'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcmsg='git commit -m'
alias gcam='git commit --amend'
alias gst='git status'
alias gb='git branch'
alias gbD='git branch -D'
alias gco-'git checkout'
alias glo='git log --oneline --decorate'
alias glg='git log'
alias grb='git rebase'
alias gua='git unadd'
alias gf='git fetch'
alias gfa='git fetch --all'\
alias gm='git merge'
alias grs='git restore'

# This safely pulls from upsream master and updates local master branch
git-re-master() {
    git checkout master && git fetch upstream && git pull upstream master
}

# This rebases current branch to match upsream/master. However to push will need to do 'git push -f'
git-re-rebase() {
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD) && git-re-master && git checkout $CURRENT_BRANCH && git rebase master
}

# Directory stuff
alias ls='ls -G'      # Ls with color
alias l='ls -1A'      # list directory
alias ll='ls -lah'    # list directory with additional information
alias -g ..='..'      # move up by one directory
alias -g ...='../..'  # move up by two directories
alias -g ....='../../..' # move up by three directories

