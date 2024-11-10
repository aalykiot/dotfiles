# Startship

eval "$(starship init zsh)"

# Eza

alias ls="eza --icons"
alias ll="eza -lag --icons"
alias lt="eza -lTg --icons"
alias lt1="eza -lTg --level=1 --icons"
alias lt2="eza -lTg --level=2 --icons"

# Syntax Highlighting & Auto Suggestions

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fzf

source <(fzf --zsh)

alias ff='nvim $(fzf -m --preview="bat --color=always {}")'

# Tab Selection

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Init Command

echo "\n" && neofetch
