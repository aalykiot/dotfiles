# Link dotfiles to local $HOME/.config directory.
#
ln -s "$PWD/.zshrc" "$HOME/.zshrc"
ln -s "$PWD/.aerospace.toml" "$HOME/.aerospace.toml"
ln -s "$PWD/ghostty" "$HOME/.config/ghostty"
ln -s "$PWD/nvim" "$HOME/.config/nvim"
ln -s "$PWD/tmux" "$HOME/.config/tmux"
ln -s "$PWD/zed" "$HOME/.config/zed"

# Install brew packages
#
brew bundle --file=./brew/Brewfile

# Install oh-my-zsh and essential plugins.
#
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install the Rust toolchain.
#
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Done! ✨"
