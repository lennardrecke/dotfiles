# History
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt append_history
setopt share_history

# Completion
autoload -Uz compinit
compinit

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias v="nvim"
alias nvim="nvim"
alias g="git"
alias gs="git status"
alias gp="git push"
alias gl="git pull"
alias ..="cd .."
alias ..."cd ../.."

# Starship prompt
eval "$(starship init zsh)"



