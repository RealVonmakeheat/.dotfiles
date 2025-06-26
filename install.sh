#!/bin/bash

# Dotfiles Installation Script
set -e

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

backup_existing() {
    local file=$1
    if [ -f "$file" ] || [ -d "$file" ]; then
        print_warning "Backing up existing $file to $BACKUP_DIR"
        mkdir -p "$BACKUP_DIR"
        mv "$file" "$BACKUP_DIR/$(basename "$file").$(date +%Y%m%d_%H%M%S)"
    fi
}

create_symlink() {
    local source=$1
    local target=$2
    
    if [ -f "$source" ]; then
        backup_existing "$target"
        mkdir -p "$(dirname "$target")"
        ln -sf "$source" "$target"
        print_status "Created symlink: $target -> $source"
    else
        print_warning "Source file not found: $source"
    fi
}

main() {
    print_status "Installing dotfiles..."
    
    # Check if we're in the dotfiles directory
    if [ ! -f "$DOTFILES_DIR/install.sh" ]; then
        print_error "Please run this script from the dotfiles directory"
        exit 1
    fi
    
    # Create config directory symlinks
    print_status "Setting up configuration files..."
    
    # Zsh
    create_symlink "$DOTFILES_DIR/config/zsh/zshrc" "$HOME/.zshrc"
    
    # Git
    create_symlink "$DOTFILES_DIR/config/git/gitconfig" "$HOME/.gitconfig"
    create_symlink "$DOTFILES_DIR/config/git/gitignore_global" "$HOME/.gitignore_global"
    
    # Alacritty
    create_symlink "$DOTFILES_DIR/config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
    
    # Tmux
    create_symlink "$DOTFILES_DIR/config/tmux/tmux.conf" "$HOME/.tmux.conf"
    
    # Vim
    create_symlink "$DOTFILES_DIR/config/vim/vimrc" "$HOME/.vimrc"
    
    print_status "Dotfiles installation complete!"
    print_status "Please restart your shell or run 'source ~/.zshrc' to apply changes."
    
    # Ask about installing development tools
    echo
    read -p "Would you like to install development tools (Rust, Python, Swift, Dart)? [y/N]: " install_dev_tools
    if [[ $install_dev_tools =~ ^[Yy]$ ]]; then
        print_status "Installing development tools..."
        
        if [ -f "$DOTFILES_DIR/scripts/install_rust.sh" ]; then
            bash "$DOTFILES_DIR/scripts/install_rust.sh"
        fi
        
        if [ -f "$DOTFILES_DIR/scripts/install_python.sh" ]; then
            bash "$DOTFILES_DIR/scripts/install_python.sh"
        fi
        
        if [ -f "$DOTFILES_DIR/scripts/install_swift.sh" ]; then
            bash "$DOTFILES_DIR/scripts/install_swift.sh"
        fi
        
        if [ -f "$DOTFILES_DIR/scripts/install_dart.sh" ]; then
            bash "$DOTFILES_DIR/scripts/install_dart.sh"
        fi
    fi
}

main "$@"
