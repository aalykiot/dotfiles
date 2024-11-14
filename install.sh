#!/bin/bash

# Create necessary directories if required

mkdir -p $HOME/brewfile
mkdir -p $HOME/.config/wezterm
mkdir -p $HOME/.config/aerospace
mkdir -p $HOME/.config/nvim

# Symlink all dotfiles

stow zsh -R --target=$HOME
stow brew -R --target=$HOME/.config
stow wezterm -R --target=$HOME/.config/wezterm
stow starship -R --target=$HOME/.config
stow aerospace -R --target=$HOME/.config/aerospace
stow nvim -R --target=$HOME/.config/nvim

# Install packages and casks

brew bundle --file=$HOME/.config/Brewfile
