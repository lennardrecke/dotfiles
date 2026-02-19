#!/usr/bin/env bash
# ─────────────────────────────────────────
#  install.sh  –  dotfiles bootstrap
#  Arch Linux / pacman + yay (AUR)
# ─────────────────────────────────────────
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_FILE="$DOTFILES_DIR/packages.txt"

# ── Colours ───────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'
info() { echo -e "${GREEN}[✔]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
error() {
  echo -e "${RED}[✘]${NC} $*" >&2
  exit 1
}

# ── Helpers ───────────────────────────────
require_arch() {
  [[ -f /etc/arch-release ]] || error "This script is for Arch Linux only."
}

install_yay() {
  if ! command -v yay &>/dev/null; then
    warn "yay not found – installing from AUR…"
    sudo pacman -S --needed --noconfirm git base-devel
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
    (cd "$tmpdir/yay" && makepkg -si --noconfirm)
    rm -rf "$tmpdir"
    info "yay installed."
  else
    info "yay already installed."
  fi
}

parse_packages() {
  # Strip comments and blank lines
  grep -v '^\s*#' "$PACKAGES_FILE" | grep -v '^\s*$'
}

install_packages() {
  info "Updating system…"
  sudo pacman -Syu --noconfirm

  mapfile -t pkgs < <(parse_packages)
  info "Installing ${#pkgs[@]} packages…"
  yay -S --needed --noconfirm "${pkgs[@]}"
}

backup_configs() {
  local backup_dir="$HOME/.config-backup-$(date +%Y%m%d_%H%M%S)"
  local backed_up=0

  for dir in "$DOTFILES_DIR"/.config/*/; do
    app=$(basename "$dir")
    target="$HOME/.config/$app"

    # Only back up if it exists and is NOT already a symlink from a previous stow
    if [[ -e "$target" && ! -L "$target" ]]; then
      if [[ $backed_up -eq 0 ]]; then
        mkdir -p "$backup_dir"
        warn "Existing configs found – backing up to $backup_dir"
      fi
      mv "$target" "$backup_dir/$app"
      warn "  Moved ~/.config/$app → $backup_dir/$app"
      backed_up=1
    fi
  done

  [[ $backed_up -eq 0 ]] && info "No existing configs to back up."
}

stow_configs() {
  info "Symlinking dotfiles with stow…"
  cd "$DOTFILES_DIR"
  for dir in .config/*/; do
    app=$(basename "$dir")
    mkdir -p "$HOME/.config/$app"
    stow --target="$HOME" --dir="$DOTFILES_DIR" --stow "$(basename "$dir")" 2>/dev/null ||
      warn "Could not stow $app (conflicts?) – skipping."
  done
  info "Dotfiles linked."
}

set_shell() {
  if [[ "$SHELL" != "$(which zsh)" ]]; then
    warn "Changing default shell to zsh…"
    chsh -s "$(which zsh)"
    info "Shell changed. Re-login to apply."
  else
    info "zsh is already the default shell."
  fi
}

enable_docker() {
  info "Enabling Docker service…"
  sudo systemctl enable --now docker
  sudo usermod -aG docker "$USER"
  warn "Log out and back in for Docker group to take effect."
}

# ── Main ──────────────────────────────────
main() {
  echo ""
  echo "  ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗"
  echo "  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝"
  echo "  ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗"
  echo "  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║"
  echo "  ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║"
  echo "  ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝"
  echo ""

  require_arch
  install_yay
  install_packages
  backup_configs
  stow_configs
  set_shell
  enable_docker

  echo ""
  info "All done! 🎉  Please reboot or re-login to apply all changes."
}

main "$@"
