#!/usr/bin/env bash
# ─────────────────────────────────────────
#  install.sh  –  dotfiles bootstrap
#  Arch Linux / pacman + yay (AUR)
#  Works on bare-metal Arch and Arch on WSL.
#
#  Usage: ./install.sh [--wsl | --desktop] [--minimal]
#    --wsl      force WSL mode (CLI packages only, no systemd/GUI)
#    --desktop  force desktop mode even if WSL is detected
#    --minimal  only install the "core" package group
# ─────────────────────────────────────────
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_FILE="$DOTFILES_DIR/packages.txt"

# Never install packages matching this (desktop environments etc.), even if
# they end up in packages.txt. Applied in WSL / minimal mode.
EXCLUDE_REGEX='^(kde|plasma|kf[56]-|qt[56]-|sddm|xorg|wayland|xdg-desktop-portal|pipewire|wireplumber|gnome)'

IS_WSL=0
MINIMAL=0

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

require_non_root() {
  # makepkg (used for yay/AUR) refuses to run as root – common on fresh WSL.
  if [[ $EUID -eq 0 ]]; then
    error "Run as a regular user with sudo access, not root.
    On WSL: create a user (useradd -m -G wheel <name>, passwd <name>,
    enable %wheel in /etc/sudoers) and set it as default in /etc/wsl.conf:
      [user]
      default=<name>"
  fi
}

detect_wsl() {
  if [[ -n "${WSL_DISTRO_NAME:-}" ]] || grep -qi microsoft /proc/sys/kernel/osrelease 2>/dev/null; then
    return 0
  fi
  return 1
}

has_systemd() {
  [[ "$(ps -p 1 -o comm= 2>/dev/null)" == "systemd" ]]
}

parse_args() {
  local force_mode=""
  for arg in "$@"; do
    case "$arg" in
    --wsl) force_mode=wsl ;;
    --desktop) force_mode=desktop ;;
    --minimal) MINIMAL=1 ;;
    -h | --help)
      sed -n '3,10p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
      exit 0
      ;;
    *) error "Unknown option: $arg" ;;
    esac
  done

  case "$force_mode" in
  wsl) IS_WSL=1 ;;
  desktop) IS_WSL=0 ;;
  *) detect_wsl && IS_WSL=1 ;;
  esac

  # WSL never gets the desktop group
  [[ $IS_WSL -eq 1 ]] && MINIMAL=1
  return 0
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
  # Print packages, honouring "# @group <name>" markers.
  # In minimal mode only the "core" group is printed.
  awk -v minimal="$MINIMAL" '
    /^[[:space:]]*#[[:space:]]*@group[[:space:]]+/ { group = $3; next }
    /^[[:space:]]*(#|$)/ { next }
    {
      if (group == "") group = "core"
      if (minimal == 1 && group != "core") next
      print $1
    }
  ' "$PACKAGES_FILE" | if [[ $MINIMAL -eq 1 ]]; then
    grep -Ev "$EXCLUDE_REGEX" || true
  else
    cat
  fi
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
  mkdir -p "$HOME/.config"
  for dir in "$DOTFILES_DIR"/.config/*/; do
    app=$(basename "$dir")
    mkdir -p "$HOME/.config/$app"
    stow --dir="$DOTFILES_DIR/.config" --target="$HOME/.config/$app" --stow "$app" 2>/dev/null ||
      warn "Could not stow $app (conflicts?) – skipping."
  done
  info "Dotfiles linked."
}

setup_zdotdir() {
  # zsh only reads ~/.zshenv by default; point it at ~/.config/zsh
  local zshenv="$HOME/.zshenv"
  local line='export ZDOTDIR="$HOME/.config/zsh"'
  if [[ -f "$zshenv" ]] && grep -qF "$line" "$zshenv"; then
    info "ZDOTDIR already set in ~/.zshenv."
  else
    echo "$line" >>"$zshenv"
    info "Set ZDOTDIR in ~/.zshenv → zsh will load ~/.config/zsh/.zshrc."
  fi
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
  if ! command -v docker &>/dev/null; then
    warn "docker not installed – skipping Docker setup."
    return
  fi

  sudo usermod -aG docker "$USER"

  if has_systemd; then
    info "Enabling Docker service…"
    sudo systemctl enable --now docker
  elif [[ $IS_WSL -eq 1 ]]; then
    warn "systemd is not running in this WSL distro – Docker service not enabled."
    warn "  Add the following to /etc/wsl.conf, then run 'wsl --shutdown' from Windows:"
    warn "    [boot]"
    warn "    systemd=true"
    warn "  (Or use Docker Desktop's WSL integration instead.)"
  else
    warn "systemd not detected – start the Docker daemon manually."
  fi
  warn "Log out and back in for Docker group to take effect."
}

# ── Main ──────────────────────────────────
main() {
  parse_args "$@"

  echo ""
  echo "  ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗"
  echo "  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝"
  echo "  ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗"
  echo "  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║"
  echo "  ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║"
  echo "  ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝"
  echo ""

  require_arch
  require_non_root

  if [[ $IS_WSL -eq 1 ]]; then
    info "WSL detected – installing CLI packages only (no desktop apps/fonts)."
  elif [[ $MINIMAL -eq 1 ]]; then
    info "Minimal mode – installing core packages only."
  fi

  install_yay
  install_packages
  backup_configs
  stow_configs
  setup_zdotdir
  set_shell
  enable_docker

  echo ""
  if [[ $IS_WSL -eq 1 ]]; then
    info "All done! 🎉  Run 'wsl --shutdown' from Windows and reopen the distro to apply all changes."
    info "Install a Nerd Font (e.g. JetBrainsMono Nerd Font) on Windows for prompt icons."
  else
    info "All done! 🎉  Please reboot or re-login to apply all changes."
  fi
}

main "$@"
