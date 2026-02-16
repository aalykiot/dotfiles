#!/usr/bin/env bash

# Update the system and install core applications.
sudo dnf -y update && sudo dnf -y upgrade
sudo dnf -y install zsh
sudo dnf -y install wget
sudo dnf -y install neovim
sudo dnf -y install tmux
sudo dnf -y install fzf
sudo dnf -y install bat
sudo dnf -y install btop
sudo dnf -y install nodejs
sudo dnf -y install golang
sudo dnf -y install zsh-autosuggestions
sudo dnf -y install zsh-syntax-highlighting
sudo dnf -y install google-chrome-stable

# Enable the copr for ghostty.
sudo dnf -y copr enable scottames/ghostty
sudo dnf -y install ghostty

# Custom install scripts.
curl -f https://zed.dev/install.sh | sh
curl -fsS https://dl.brave.com/install.sh | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y

# Setup zsh and oh-my-zsh as the default shell.
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.sh" >> ~/.zshrc

# Symlink personal dotfiles.
ln -s "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
ln -s "$HOME/dotfiles/tmux" "$HOME/.config/tmux"
ln -s "$HOME/dotfiles/.zshrc.custom" "$HOME/.zshrc.custom"
ln -sf "$HOME/dotfiles/zed/settings.json" "$HOME/.config/zed/settings.json"
ln -sf "$HOME/dotfiles/zed/keymap.json" "$HOME/.config/zed/keymap.json"
cp -f "$HOME/dotfiles/ghostty/config" "$HOME/.config/ghostty/"

# Clone tmux plugin manager.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Source the custom .zshrc.
echo "source $HOME/.zshrc.custom" >> ~/.zshrc
echo "Done! ✨"
