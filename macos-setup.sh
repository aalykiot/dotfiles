#!/usr/bin/env bash

# Install core applications.
brew install wget
brew install zsh
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install unzip
brew install fzf
brew install neovim
brew install lazygit
brew install ripgrep
brew install btop
brew install bat
brew install tmux
brew install go
brew install n
brew install --cask raycast
brew install --cask nikitabobko/tap/aerospace
brew install --cask zed
brew install --cask brave-browser
brew install --cask ghostty
brew install --cask font-meslo-lg-nerd-font
brew install --cask font-jetbrains-mono-nerd-font

# Custom install scripts.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y

# Symlink personal dotfiles.
ln -s "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
ln -s "$HOME/dotfiles/tmux" "$HOME/.config/tmux"
ln -s "$HOME/dotfiles/.zshrc.custom" "$HOME/.zshrc.custom"
ln -s "$HOME/dotfiles/.aerospace.toml" "$HOME/.aerospace.toml"

# We need to create the following folders for the symlink to work.
mkdir "$HOME/.config/zed"
mkdir "$HOME/.config/ghostty"

ln -sf "$HOME/dotfiles/zed/settings.json" "$HOME/.config/zed/settings.json"
ln -sf "$HOME/dotfiles/zed/keymap.json" "$HOME/.config/zed/keymap.json"
cp -f "$HOME/dotfiles/ghostty/config" "$HOME/.config/ghostty/"

# Clone tmux plugin manager.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Setup zsh and oh-my-zsh as the default shell.
chsh -s $(which zsh)

echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source $HOME/.zshrc.custom" >> ~/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
