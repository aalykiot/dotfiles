#!/usr/bin/env bash

# Update the system and install core applications.
sudo dnf -y update
sudo dnf -y install zsh
sudo dnf -y install wget
sudo dnf -y install neovim
sudo dnf -y install tmux
sudo dnf -y install fzf
sudo dnf -y install bat
sudo dnf -y install htop
sudo dnf -y install nodejs
sudo dnf -y install golang
sudo dnf -y install zsh-autosuggestions
sudo dnf -y install zsh-syntax-highlighting
sudo dnf -y install google-chrome-stable
sudo dnf -y install gnome-tweaks
sudo dnf -y install unzip

# Enable the copr for ghostty.
sudo dnf -y copr enable scottames/ghostty
sudo dnf -y install ghostty

# Enable microsoft packages and install vscode.
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo
sudo dnf check-update && sudo dnf install code

# Custom install scripts.
curl -fsS https://dl.brave.com/install.sh | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y

# Symlink personal dotfiles.
ln -s "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
ln -s "$HOME/dotfiles/tmux" "$HOME/.config/tmux"
ln -s "$HOME/dotfiles/.zshrc.custom" "$HOME/.zshrc.custom"

# We need to create the following folders for the symlink to work.
mkdir -p "$HOME/.config/zed"
mkdir -p "$HOME/.config/ghostty"
mkdir -p "$HOME/.config/Code/User"

cp -f "$HOME/dotfiles/ghostty/config" "$HOME/.config/ghostty/"
cp -f "$HOME/dotfiles/vscode/settings.json" "$HOME/.config/Code/User/"
cp -f "$HOME/dotfiles/vscode/keybindings.json" "$HOME/.config/Code/User/"

# Clone tmux plugin manager.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source $HOME/.zshrc.custom" >> ~/.zshrc

