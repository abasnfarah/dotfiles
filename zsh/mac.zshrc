# Path to your oh-my-zsh installation.
export ZSH=/Users/abasfarah/.oh-my-zsh
export TERM="screen-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="Agnoster"
#ZSH_THEME="powerlevel9k/powerlevel9k"
# archey
# screenfetch

# Uncomment the following line to use case-sensitive completion.
# Tmux set up
alias tmux="TERM=screen-256color tmux -2"

# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.lias
# DISABLE_AUTO_UPDATE="true"

# Meta Aliases
alias subl="open -a sublime\ text"
alias prof="vim ~/.zshrc"
alias idle="open -a idle"
alias reprof="clear && source ~/.zshrc"
alias tree="tree -a"
alias vprof="vim ~/.vimrc"
alias v="vim"
alias ht="goals && open Habit*"
alias va="cd ~/Documents/repo/vague"
alias sp="va && ./start-proxy.sh"
alias vh="vagrant halt"
alias murder="vagrant destroy"
alias vr="vagrant reload"
alias vp="vagrant provision"
alias workon="source ./env/bin/activate"
alias gpd="git push origin --delete "
alias tprof="vim ~/.tmux.conf"
#alias workon="source /Users/farah127/Documents/websiteEnv/bin/activate"

# Java Compiling and running
alias jc="javac"
alias j="java"

# File jumping

function StarWars {
    echo "Are you ready for some StarWars Brahh" && archey && sleep 2 && tree ~ && telnet towel.blinkenlights.nl 
}

function js {
    cd ~/Documents/Junior_Year/Spring_Semester
}
function sc9 {
    cd ~/Documents/Summer\ 2016/CSCI\ 1933\ Intro\ to\ alg\ and\ data\ struc/
}

function ds {
    cd 
}
function sc9s {
    sc9 && cd Sample_code
}

function algt {
    cd ~/Documents/Fall\ Semester/CSCI_4043_AlgAndDataStruc/Textbook
}

function afw {
    cd ~/Documents/Personal_Projects/abasfarah.com
}

function cb {
    cd ~/Documents/Coding_Challanges/CoderByte
}

function goals {
    cd ~/Documents/Personal\ Projects/Goals/
}

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# OPAM configuration
. /Users/abasfarah/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
