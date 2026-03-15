#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Home directory dotfiles (files/dirs starting with . but not .git, .config, .github)
HOME_DOTFILES=(
  .zshrc
  .zsh_alias
  .gitconfig
)

# .config items (directories and files inside .config/)
CONFIG_ITEMS=(
  ghostty
  mise
  nvim
  starship.toml
  yazi
)

backup_if_exists() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mkdir -p "$BACKUP_DIR"
    log_warn "Backing up existing $target to $BACKUP_DIR/"
    mv "$target" "$BACKUP_DIR/"
  fi
}

create_symlink() {
  local src="$1"
  local dest="$2"

  if [[ -L "$dest" ]]; then
    local current_link
    current_link=$(readlink "$dest")
    if [[ "$current_link" == "$src" ]]; then
      log_success "$dest -> $src (already linked)"
      return 0
    else
      log_warn "Removing existing symlink: $dest -> $current_link"
      rm "$dest"
    fi
  fi

  backup_if_exists "$dest"
  ln -s "$src" "$dest"
  log_success "$dest -> $src"
}

main() {
  log_info "Dotfiles directory: $DOTFILES_DIR"
  echo

  # Link home directory dotfiles
  log_info "Linking home directory dotfiles..."
  for item in "${HOME_DOTFILES[@]}"; do
    src="$DOTFILES_DIR/$item"
    dest="$HOME/$item"
    if [[ -e "$src" ]]; then
      create_symlink "$src" "$dest"
    else
      log_warn "Source not found: $src"
    fi
  done
  echo

  # Link .config items
  log_info "Linking .config items..."
  mkdir -p "$HOME/.config"
  for item in "${CONFIG_ITEMS[@]}"; do
    src="$DOTFILES_DIR/.config/$item"
    dest="$HOME/.config/$item"
    if [[ -e "$src" ]]; then
      create_symlink "$src" "$dest"
    else
      log_warn "Source not found: $src"
    fi
  done
  echo

  if [[ -d "$BACKUP_DIR" ]]; then
    log_info "Backups saved to: $BACKUP_DIR"
  fi

  log_success "Done!"
}

main "$@"
