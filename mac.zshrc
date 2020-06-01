# Go Enviroment/Path
export GOBIN=/Users/abasfarah/go/bin
export GOPATH=/Users/abasfarah/go

export Path=$PATH:$GOBIN

# Brew issues
export PATH="/usr/local/sbin:$PATH"
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Path to your oh-my-zsh installation.
export ZSH=/Users/abasfarah/.oh-my-zsh
export TERM="screen-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="powerlevel9k/powerlevel9k"
archey
# screenfetch

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Tmux set up
alias tmux="TERM=screen-256color tmux -2"


# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.lias
# DISABLE_AUTO_UPDATE="true"

# Meta Aliases
alias subl="open -a sublime\ text"
alias eprof="emacs ~/.zshrc"
alias prof="vim ~/.zshrc"
alias idle="open -a idle"
alias reprof="clear && source ~/.zshrc"
alias tree="tree -a"
alias vprof="vim ~/.vimrc"
alias v="vim"
alias e="emacs"
alias gpd="git push origin --delete "
alias tprof="v ~/.tmux.conf"  
#alias terprof="v ~/.config/termite/config"
#alias rcprof="v ~/.config/awesome/rc.lua"
#alias xprof="v ~/.xinitrc"
alias wp=" cd ~/workspaces"
alias p3="python3"
#alias workon="source /Users/farah127/Documents/websiteEnv/bin/activate"

# tmux aliases
alias ts="tmux new -s"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tkill="tmux kill-server"

# C++ C Java Compiling and running
alias jc="javac"
alias j="java"
alias gcpp="g++ -std=c++11"

# Temp Aliases to open up textbooks
alias math2374="open $HOME/Documents/2019_2020_SchoolYear/2020_Spring/MATH_2374/textbook/Text_Math_2374.pdf"
alias ee2115="open $HOME/Documents/2019_2020_SchoolYear/2020_Spring/EE_2115/textbook/Electric_Circuits.pdf"
alias see2115="open $HOME/Documents/2019_2020_SchoolYear/2020_Spring/EE_2115/textbook/Solutions_Electric_Circuits.pdf"
alias algoBook="open $HOME/Documents/2019_2020_SchoolYear/2019_Fall/CSCI2041_AlgAndDataStruc/textbooks/CLRS.pdf"
# File jumping

# GoLang Compiling and runing
alias gor="go run"
alias gob="go build"

function StarWars {
    echo "Are you ready for some StarWars Brahh" && archey && sleep 2 && tree ~ && telnet towel.blinkenlights.nl 
}

# Easy way to check for command_existing in shell scripts
command_exists () {
  type "$1" &> /dev/null ;
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
COMPLETION_WAITING_DOTS="true"

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



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Sourcing zsh-syntax-highligting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
