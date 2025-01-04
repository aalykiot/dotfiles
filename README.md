# My dotfiles 👨‍💻

These are the dotfiles that configure the tools I use in my system, and some installation scripts that automatically install all the following packages. I constantly try to improve my development workflow.

### Setup

First, clone the repo in your `$HOME` directory:

```sh
$ git clone git@github.com/aalykiot/dotfiles
```

then, use `make` to install the required packages:

```sh
$ cd dotfiles/ && make install
```

finally, symlink the config files to the right places:

```sh
$ stow .
```

> For VSCode we need to manually symlink the settings.json: `ln -s <TARGET> <LINK-NAME>`

## Tools and Packages

- [Raycast](https://raycast.com) - A collection of powerful productivity tools all within an extendable launcher.
- [Aerospace](https://nikitabobko.github.io/AeroSpace/guide) - An i3-like tiling window manager for MacOS.
- [Zsh](https://www.zsh.org/) - An extended version of Bash with new features.
- [Oh My Zsh](https://ohmyz.sh/) - A framework for managing ZSH configurations.
- [Nerd Fonts](https://www.nerdfonts.com/) - Developer fonts with a high number of glyphs (icons).
- [Alacritty](https://alacritty.org/) - A cross-platform, OpenGL terminal emulator.
- [NeoVim](https://neovim.io/) - Hyperextensible Vim-based text editor.
- [Visual Studio Code](https://code.visualstudio.com/) - Integrated development environment developed by Microsoft.
- [LazyGit](https://github.com/jesseduffield/lazygit) - Simple terminal UI for git commands.
- [Tmux](https://github.com/tmux/tmux/wiki) - A terminal multiplexer.
