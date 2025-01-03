# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Export nvm completion settings for zsh-nvm plugin
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light lukechilds/zsh-nvm

# Load completions
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# To customize the prompt, source the oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/prompt.toml)"
fi

eval "$(oh-my-posh init zsh)"
eval "$(fzf --zsh)"
