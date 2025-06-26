# Dotfiles

My personal dotfiles and system configuration.

## Overview

This repository contains my personal configuration files for various tools and applications:

- **Alacritty** - Terminal emulator configuration
- **Git** - Git configuration and global gitignore
- **Tmux** - Terminal multiplexer configuration  
- **Vim** - Text editor configuration
- **Zsh** - Shell configuration with aliases, exports, and functions

## Installation

### Quick Install

```bash
git clone https://github.com/yourusername/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

### Manual Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/.dotfiles.git ~/.dotfiles
   ```

2. Create symlinks for the configuration files you want to use:
   ```bash
   # Zsh
   ln -sf ~/.dotfiles/config/zsh/zshrc ~/.zshrc
   
   # Git
   ln -sf ~/.dotfiles/config/git/gitconfig ~/.gitconfig
   ln -sf ~/.dotfiles/config/git/gitignore_global ~/.gitignore_global
   
   # Alacritty
   mkdir -p ~/.config/alacritty
   ln -sf ~/.dotfiles/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
   
   # Tmux
   ln -sf ~/.dotfiles/config/tmux/tmux.conf ~/.tmux.conf
   
   # Vim
   ln -sf ~/.dotfiles/config/vim/vimrc ~/.vimrc
   ```

## Structure

```
.dotfiles/
├── config/           # Configuration files
│   ├── alacritty/   # Terminal emulator config
│   ├── git/         # Git configuration
│   ├── tmux/        # Terminal multiplexer config
│   ├── vim/         # Text editor config
│   └── zsh/         # Shell configuration
├── scripts/         # Installation and setup scripts
└── install.sh       # Main installation script
```

## Features

### Zsh Configuration
- Custom aliases for common commands
- Environment variables and exports
- Useful functions for development
- Clean and minimal prompt

### Git Configuration
- Global gitignore for common files
- Useful aliases and configurations
- Better diff and merge tools

### Development Tools
- Language-specific installation scripts
- Development environment setup

## Customization

Feel free to fork this repository and customize it for your own needs. The configuration files are designed to be modular and easy to modify.

## License

This project is open source and available under the [MIT License](LICENSE).
