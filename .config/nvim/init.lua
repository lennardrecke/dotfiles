-- ─────────────────────────────────────────────────────────────
--  init.lua  –  Neovim config
--  Plugin manager: packer.nvim
-- ─────────────────────────────────────────────────────────────
vim.deprecate = function() end

-- ── Options ───────────────────────────────────────────────────
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.signcolumn = "yes" -- always show sign column (avoid layout shifts)
vim.opt.scrolloff = 8 -- keep 8 lines above/below cursor

vim.opt.tabstop = 2 -- 2-space tabs
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- spaces, not tab characters
vim.opt.smartindent = true

vim.opt.wrap = false -- no line wrapping
vim.opt.termguicolors = true -- true colour support
vim.opt.splitright = true -- vertical splits open to the right
vim.opt.splitbelow = true -- horizontal splits open below

vim.opt.ignorecase = true -- case-insensitive search …
vim.opt.smartcase = true -- … unless you type uppercase
vim.opt.hlsearch = false -- don't keep search highlights

vim.opt.updatetime = 250 -- faster CursorHold events
vim.opt.timeoutlen = 300 -- faster which-key popup
vim.opt.undofile = true -- persistent undo history

vim.g.mapleader = " " -- <Space> as leader key
vim.g.maplocalleader = " "

-- ── Keymaps ───────────────────────────────────────────────────
local map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Better window navigation
map("n", "<C-h>", "<C-w>h", "Move to left window")
map("n", "<C-l>", "<C-w>l", "Move to right window")
map("n", "<C-j>", "<C-w>j", "Move to lower window")
map("n", "<C-k>", "<C-w>k", "Move to upper window")

-- Keep cursor centred when jumping
map("n", "<C-d>", "<C-d>zz", "Scroll down (centred)")
map("n", "<C-u>", "<C-u>zz", "Scroll up (centred)")
map("n", "n", "nzzzv", "Next search result (centred)")
map("n", "N", "Nzzzv", "Prev search result (centred)")

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move selection up")

-- Paste without losing register
map("v", "<leader>p", '"_dP', "Paste without clobbering register")

-- Save & quit shortcuts
map("n", "<leader>w", "<cmd>w<CR>", "Save file")
map("n", "<leader>q", "<cmd>q<CR>", "Quit")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlight")

-- ── Bootstrap packer.nvim ─────────────────────────────────────
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd("packadd packer.nvim")
end

-- Auto-compile whenever this file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

-- ── Plugins ───────────────────────────────────────────────────
require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- packer manages itself

	-- ── Icons (used by many plugins) ──────────────────────────
	use("nvim-tree/nvim-web-devicons")

	-- ── Status line ───────────────────────────────────────────
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
		end,
	})

	-- ── File tree ─────────────────────────────────────────────
	use({
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				view = { width = 35 },
				filters = { dotfiles = false },
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")
					-- Start with all default mappings
					api.config.mappings.default_on_attach(bufnr)
					local map = function(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, nowait = true, desc = desc })
					end
					-- Override h/l for navigation
					map("l", api.node.open.edit, "Open / expand")
					map("h", api.node.navigate.parent_close, "Close / collapse")
				end,
			})
			vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle file tree" })
		end,
	})

	-- ── Fuzzy finder ──────────────────────────────────────────
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					preview = {
						treesitter = false, -- use vim's built-in highlighting instead
					},
				},
			})
			telescope.load_extension("fzf")
			local map = function(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
			end
			map("<leader>ff", "<cmd>Telescope find_files<CR>", "Find files")
			map("<leader>fg", "<cmd>Telescope live_grep<CR>", "Live grep")
			map("<leader>fb", "<cmd>Telescope buffers<CR>", "Buffers")
			map("<leader>fh", "<cmd>Telescope help_tags<CR>", "Help tags")
			map("<leader>fr", "<cmd>Telescope oldfiles<CR>", "Recent files")
		end,
	})

	-- ── Syntax highlighting ───────────────────────────────────
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.config").setup({
				ensure_installed = {
					"lua",
					"python",
					"javascript",
					"typescript",
					"bash",
					"json",
					"yaml",
					"toml",
					"markdown",
					"html",
					"css",
				},
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = true,
			})
		end,
	})

	-- ── LSP ───────────────────────────────────────────────────
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim", -- LSP status in the corner
		},
		config = function()
			require("mason").setup()
			require("fidget").setup()

			-- Servers to auto-install
			-- Full list: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
			local servers = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"bashls",
				"jsonls",
				"cssls",
				"html",
			}

			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = true,
			})

			-- LSP keymaps — attached whenever an LSP connects to a buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local bmap = function(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = event.buf, silent = true, desc = desc })
					end
					bmap("gd", vim.lsp.buf.definition, "Go to definition")
					bmap("gD", vim.lsp.buf.declaration, "Go to declaration")
					bmap("gr", vim.lsp.buf.references, "References")
					bmap("gi", vim.lsp.buf.implementation, "Go to implementation")
					bmap("K", vim.lsp.buf.hover, "Hover docs")
					bmap("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
					bmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
					bmap("<leader>d", vim.diagnostic.open_float, "Show diagnostic")
					bmap("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
					bmap("]d", vim.diagnostic.goto_next, "Next diagnostic")
				end,
			})

			-- Use new vim.lsp.config API (nvim 0.11+)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", { capabilities = capabilities })

			-- Per-server overrides
			vim.lsp.config("lua_ls", {
				settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			})

			-- Enable all servers managed by mason-lspconfig
			vim.lsp.enable(servers)
		end,
	})

	-- ── Autocompletion ────────────────────────────────────────
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	})

	-- ── Formatting ────────────────────────────────────────────
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					markdown = { "prettier" },
				},
				format_on_save = { timeout_ms = 500, lsp_fallback = true },
			})
			vim.keymap.set("n", "<leader>f", function()
				require("conform").format({ async = true })
			end, { silent = true, desc = "Format file" })
		end,
	})

	-- ── Git signs ─────────────────────────────────────────────
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
				},
			})
		end,
	})

	-- ── Auto-close brackets ───────────────────────────────────
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	})

	-- ── Commenting ────────────────────────────────────────────
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- ── Which-key ─────────────────────────────────────────────
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
			require("which-key").add({
				{ "<leader>f", group = "Find (Telescope)" },
				{ "<leader>c", group = "Code / LSP" },
				{ "<leader>g", group = "Git" },
			})
		end,
	})

	-- ── Indent guides ─────────────────────────────────────────
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	})

	-- ── Bufferline ────────────────────────────────────────────
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				options = { offsets = { { filetype = "NvimTree", text = "Files", padding = 1 } } },
			})
			local map = function(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
			end
			map("<S-h>", "<cmd>BufferLineCyclePrev<CR>", "Prev buffer")
			map("<S-l>", "<cmd>BufferLineCycleNext<CR>", "Next buffer")
			map("<leader>bd", "<cmd>bdelete<CR>", "Close buffer")
		end,
	})

	-- ── opencode.nvim (AI coding agent) ───────────────────────
	-- Requires: opencode CLI installed (add to packages.txt)
	-- Docs:     https://github.com/nickjvandyke/opencode.nvim
	use({
		"nickjvandyke/opencode.nvim",
		config = function()
			vim.o.autoread = true -- reload buffers when opencode edits files

			vim.g.opencode_opts = {
				provider = {
					enabled = "terminal",
					terminal = {},
				},
			}

			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
			end

			map({ "n", "x" }, "<leader>oo", function()
				require("opencode").toggle()
			end, "Toggle opencode")
			map({ "n", "x" }, "<leader>oa", function()
				require("opencode").ask()
			end, "Ask opencode")
			map({ "n", "x" }, "<leader>os", function()
				require("opencode").select()
			end, "Select opencode action")

			-- Operator: send range/line to opencode
			map({ "n", "x" }, "go", function()
				return require("opencode").operator("@this ")
			end, "Send range to opencode")
			map("n", "goo", function()
				return require("opencode").operator("@this ") .. "_"
			end, "Send line to opencode")

			-- Session scrolling
			map({ "n", "t" }, "<S-C-u>", function()
				require("opencode").command("session.half.page.up")
			end, "Scroll opencode up")
			map({ "n", "t" }, "<S-C-d>", function()
				require("opencode").command("session.half.page.down")
			end, "Scroll opencode down")
		end,
	})
end)
