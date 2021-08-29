# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.local.zsh
source ~/.aliases.zsh

# FZF setup 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # mac
#source /usr/share/fzf/key-bindings.zsh # arch
#source /usr/share/fzf/completion.zsh # arch 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme # mac
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme # arch

# Sourcing zsh-syntax-highligting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # mac
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # arch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GPG_TTY=$(tty)
