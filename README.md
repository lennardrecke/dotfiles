# dotfiles

My personal dotfiles for Arch Linux (bare metal or WSL) with zsh, Neovim, and development tools.

## What's Included

- **Shell**: zsh with Starship prompt, autosuggestions, and syntax highlighting
- **Editor**: Neovim with a full plugin setup (LSP, completion, treesitter, fuzzy finding, git signs, etc.)
- **Tools**: git, tmux, fzf, bat, eza, zoxide, and more
- **Development**: Node.js, npm, Bun, Docker

## Quick Start

Run the install script on a fresh Arch Linux system:

```bash
./install.sh
```

The script will:
1. Install yay (AUR helper) if not present
2. Install packages from `packages.txt`
3. Back up existing configs to `~/.config-backup-YYYYMMDD_HHMMSS/`
4. Symlink dotfiles using GNU Stow
5. Set zsh as the default shell
6. Enable Docker (if systemd is running)

### Options

| Flag | Effect |
|------|--------|
| `--wsl` | Force WSL mode (only `core` packages, no GUI apps/fonts) |
| `--desktop` | Force desktop mode even when WSL is detected |
| `--minimal` | Only install the `core` package group |

### WSL (Arch Linux)

WSL is detected automatically. In WSL mode only the `core` group in `packages.txt`
is installed, so no desktop apps, fonts or desktop-environment packages (KDE/Plasma,
Qt, Xorg, ...) are pulled in.

Prerequisites:
- Run as a **regular user with sudo**, not root (`makepkg` refuses to run as root).
  Set it as the default user in `/etc/wsl.conf` (`[user]` → `default=<name>`).
- For Docker inside WSL, enable systemd in `/etc/wsl.conf` (`[boot]` → `systemd=true`)
  and run `wsl --shutdown`, or use Docker Desktop's WSL integration instead.
- Install a Nerd Font on **Windows** and select it in Windows Terminal for prompt icons.

### Package groups

`packages.txt` is split with `# @group <name>` markers:
- `core`: CLI and dev tools, installed everywhere
- `desktop`: GUI apps and fonts, skipped on WSL and with `--minimal`

## Structure

```
.dotfiles/
├── install.sh           # Bootstrap script
├── packages.txt         # Package list (pacman + AUR), grouped core/desktop
├── .config/
│   ├── nvim/           # Neovim config (init.lua + plugins)
│   └── zsh/            # Zsh config (.zshrc)
└── .editorconfig       # Editor config
```

## Neovim Plugins

| Plugin | Description |
|--------|-------------|
| packer.nvim | Plugin manager |
| lualine.nvim | Status line |
| nvim-tree.lua | File tree |
| telescope.nvim | Fuzzy finder |
| nvim-treesitter | Syntax highlighting |
| nvim-lspconfig + mason.nvim | LSP support |
| nvim-cmp | Autocomplete |
| conform.nvim | Formatting |
| gitsigns.nvim | Git integration |
| nvim-autopairs | Auto-close brackets |
| Comment.nvim | Commenting |
| which-key.nvim | Keybinding hints |
| indent-blankline.nvim | Indent guides |
| bufferline.nvim | Buffer tabs |
| opencode.nvim | AI coding assistant |

## Keybindings

### Neovim

| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<C-h/j/k/l>` | Navigate windows |
| `<leader>E` | Toggle file tree |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep |
| `<leader>fr` | Recent files |
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<S-h/l>` | Previous/next buffer |
| `gd` | Go to definition |
| `K` | Hover docs |

### Zsh Aliases

| Alias | Command |
|-------|---------|
| `v` | nvim |
| `g` | git |
| `gs` | git status |
| `..` | cd .. |

## Manual Steps After Install

1. **Restart shell** or log out/in for zsh to activate
2. **Log out and back in** for Docker group to take effect
3. **Sync Neovim plugins**: Open nvim and run `:PackerSync`

## Requirements

- Arch Linux (bare metal or WSL)
- sudo access (for pacman/yay)
- Internet connection
