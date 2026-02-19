# dotfiles

My personal dotfiles for Arch Linux with zsh, Neovim, and development tools.

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
2. Install all packages from `packages.txt`
3. Back up existing configs to `~/.config-backup-YYYYMMDD_HHMMSS/`
4. Symlink dotfiles using GNU Stow
5. Set zsh as the default shell
6. Enable Docker

## Structure

```
.dotfiles/
├── install.sh           # Bootstrap script
├── packages.txt         # Package list (pacman + AUR)
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

- Arch Linux
- sudo access (for pacman/yay)
- Internet connection
