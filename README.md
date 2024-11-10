# My development setup 👨‍💻 

This repo contains installation scripts and dotfiles for my system.

## Requirements

Ensure you have the following installed on your system.

### Git

```sh
$ brew install git
```

### Stow

```sh
$ brew install stow
```

## Installation

First, check out the `dev-setup` repo in your $HOME directory using git:

```sh
$ git clone git@github.com/aalykiot/dotfiles
$ cd dev-setup
```

then use GNU stow to create symlinks:

```sh
$ stow .
```

## Cask Packages

- [Raycast](https://raycast.com) - A collection of powerful productivity tools all within an extendable launcher.
- [Zen Browser](https://zen-browser.app) - Zen is based on Firefox, prioritizes security and privacy.
- [Zsh](https://www.zsh.org/) - An extended version of Bash with new features.
- [WezTerm](https://wezfurlong.org/wezterm/index.html) - A powerful cross-platform terminal emulator and multiplexer.
- [Starship](https://starship.rs/) - The minimal, blazing-fast, and infinitely customizable prompt for any shell.
- [NeoVim](https://neovim.io/) - Hyperextensible Vim-based text editor.
- [Visual Studio Code](https://code.visualstudio.com/) - Integrated development environment developed by Microsoft.
