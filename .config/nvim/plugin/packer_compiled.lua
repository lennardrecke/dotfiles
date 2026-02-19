-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/talos/.cache/nvim/packer_hererocks/2.1.1767980792/share/lua/5.1/?.lua;/home/talos/.cache/nvim/packer_hererocks/2.1.1767980792/share/lua/5.1/?/init.lua;/home/talos/.cache/nvim/packer_hererocks/2.1.1767980792/lib/luarocks/rocks-5.1/?.lua;/home/talos/.cache/nvim/packer_hererocks/2.1.1767980792/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/talos/.cache/nvim/packer_hererocks/2.1.1767980792/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nV\0\3\t\0\6\0\n6\3\0\0009\3\1\0039\3\2\3'\5\3\0\18\6\0\0\18\a\1\0005\b\4\0=\2\5\bB\3\5\1K\0\1\0\tdesc\1\0\2\tdesc\0\vsilent\2\6n\bset\vkeymap\bvimî\2\1\0\6\0\18\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0004\4\3\0005\5\3\0>\5\1\4=\4\5\3=\3\a\2B\0\2\0013\0\b\0\18\1\0\0'\3\t\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\f\0'\4\r\0'\5\14\0B\1\4\1\18\1\0\0'\3\15\0'\4\16\0'\5\17\0B\1\4\1K\0\1\0\17Close buffer\21<cmd>bdelete<CR>\15<leader>bd\16Next buffer!<cmd>BufferLineCycleNext<CR>\n<S-l>\16Prev buffer!<cmd>BufferLineCyclePrev<CR>\n<S-h>\0\foptions\1\0\1\foptions\0\foffsets\1\0\1\foffsets\0\1\0\3\ttext\nFiles\fpadding\3\1\rfiletype\rNvimTree\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\fconform\frequire£\4\1\0\6\0\31\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\20\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\21\0025\3\22\0=\3\23\2B\0\2\0016\0\24\0009\0\25\0009\0\26\0'\2\27\0'\3\28\0003\4\29\0005\5\30\0B\0\5\1K\0\1\0\1\0\2\tdesc\16Format file\vsilent\2\0\14<leader>f\6n\bset\vkeymap\bvim\19format_on_save\1\0\2\15timeout_ms\3ô\3\17lsp_fallback\2\21formatters_by_ft\1\0\2\19format_on_save\0\21formatters_by_ft\0\rmarkdown\1\2\0\0\rprettier\bcss\1\2\0\0\rprettier\thtml\1\2\0\0\rprettier\tjson\1\2\0\0\rprettier\15typescript\1\2\0\0\rprettier\15javascript\1\2\0\0\rprettier\vpython\1\2\0\0\nblack\blua\1\0\b\vpython\0\thtml\0\rmarkdown\0\tjson\0\bcss\0\15javascript\0\15typescript\0\blua\0\1\2\0\0\vstylua\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nµ\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\2B\0\2\1K\0\1\0\nsigns\1\0\1\nsigns\0\vdelete\1\0\1\ttext\5\vchange\1\0\1\ttext\bâ–Ž\badd\1\0\3\badd\0\vdelete\0\vchange\0\1\0\1\ttext\bâ–Ž\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bibl\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n¸\1\0\0\a\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\1\5\1\18\3\1\0009\1\6\1'\4\a\0009\5\b\0B\5\1\0A\1\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3\1\0B\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3\1\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleÜ\4\1\0\f\0\"\0>6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0019\2\5\0005\4\t\0005\5\a\0003\6\6\0=\6\b\5=\5\n\0049\5\v\0009\5\f\0059\5\r\0055\a\15\0009\b\v\0009\b\14\bB\b\1\2=\b\16\a9\b\v\0009\b\17\bB\b\1\2=\b\18\a9\b\v\0009\b\19\b5\n\20\0B\b\2\2=\b\21\a9\b\v\0003\n\22\0005\v\23\0B\b\3\2=\b\24\a9\b\v\0003\n\25\0005\v\26\0B\b\3\2=\b\27\aB\5\2\2=\5\v\0049\5\28\0009\5\29\0054\a\5\0005\b\30\0>\b\1\a5\b\31\0>\b\2\a5\b \0>\b\3\a5\b!\0>\b\4\aB\5\2\2=\5\29\4B\2\2\0012\0\0€K\0\1\0\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\1\0\5\f<S-Tab>\0\n<Tab>\0\t<CR>\0\n<C-e>\0\14<C-Space>\0\rcomplete\vinsert\vpreset\fmapping\fsnippet\1\0\3\fmapping\0\fsnippet\0\fsources\0\vexpand\1\0\1\vexpand\0\0\nsetup\14lazy_load luasnip.loaders.from_vscode\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nw\0\3\n\1\b\0\r6\3\0\0009\3\1\0039\3\2\3'\5\3\0\18\6\0\0\18\a\1\0005\b\5\0-\t\0\0009\t\4\t=\t\6\b=\2\a\bB\3\5\1K\0\1\0\0À\tdesc\vbuffer\1\0\3\vbuffer\0\tdesc\0\vsilent\2\bbuf\6n\bset\vkeymap\bvim˜\5\1\1\a\0#\0P3\1\0\0\18\2\1\0'\4\1\0006\5\2\0009\5\3\0059\5\4\0059\5\5\5'\6\6\0B\2\4\1\18\2\1\0'\4\a\0006\5\2\0009\5\3\0059\5\4\0059\5\b\5'\6\t\0B\2\4\1\18\2\1\0'\4\n\0006\5\2\0009\5\3\0059\5\4\0059\5\v\5'\6\f\0B\2\4\1\18\2\1\0'\4\r\0006\5\2\0009\5\3\0059\5\4\0059\5\14\5'\6\15\0B\2\4\1\18\2\1\0'\4\16\0006\5\2\0009\5\3\0059\5\4\0059\5\17\5'\6\18\0B\2\4\1\18\2\1\0'\4\19\0006\5\2\0009\5\3\0059\5\4\0059\5\20\5'\6\21\0B\2\4\1\18\2\1\0'\4\22\0006\5\2\0009\5\3\0059\5\4\0059\5\23\5'\6\24\0B\2\4\1\18\2\1\0'\4\25\0006\5\2\0009\5\26\0059\5\27\5'\6\28\0B\2\4\1\18\2\1\0'\4\29\0006\5\2\0009\5\26\0059\5\30\5'\6\31\0B\2\4\1\18\2\1\0'\4 \0006\5\2\0009\5\26\0059\5!\5'\6\"\0B\2\4\0012\0\0€K\0\1\0\20Next diagnostic\14goto_next\a]d\24Previous diagnostic\14goto_prev\a[d\20Show diagnostic\15open_float\15diagnostic\14<leader>d\16Code action\16code_action\15<leader>ca\18Rename symbol\vrename\15<leader>rn\15Hover docs\nhover\6K\25Go to implementation\19implementation\agi\15References\15references\agr\22Go to declaration\16declaration\agD\21Go to definition\15definition\bbuf\blsp\bvim\agd\0ü\4\1\0\n\0!\0:6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\0015\0\4\0006\1\0\0'\3\5\0B\1\2\0029\1\2\0015\3\6\0=\0\a\3B\1\2\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0005\4\r\0003\5\f\0=\5\14\4B\1\3\0016\1\0\0'\3\15\0B\1\2\0029\1\16\1B\1\1\0026\2\b\0009\2\17\0029\2\18\2'\4\19\0005\5\20\0=\1\21\5B\2\3\0016\2\b\0009\2\17\0029\2\18\2'\4\22\0005\5\30\0005\6\28\0005\a\26\0005\b\24\0005\t\23\0=\t\25\b=\b\27\a=\a\29\6=\6\31\5B\2\3\0016\2\b\0009\2\17\0029\2 \2\18\4\0\0B\2\2\1K\0\1\0\venable\rsettings\1\0\1\rsettings\0\bLua\1\0\1\bLua\0\16diagnostics\1\0\1\16diagnostics\0\fglobals\1\0\1\fglobals\0\1\2\0\0\bvim\vlua_ls\17capabilities\1\0\1\17capabilities\0\6*\vconfig\blsp\25default_capabilities\17cmp_nvim_lsp\rcallback\1\0\1\rcallback\0\0\14LspAttach\24nvim_create_autocmd\bapi\bvim\21ensure_installed\1\0\2\27automatic_installation\2\21ensure_installed\0\20mason-lspconfig\1\b\0\0\vlua_ls\fpyright\nts_ls\vbashls\vjsonls\ncssls\thtml\vfidget\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nw\0\3\n\1\a\0\f6\3\0\0009\3\1\0039\3\2\3'\5\3\0\18\6\0\0\18\a\1\0005\b\4\0-\t\0\0=\t\5\b=\2\6\bB\3\5\1K\0\1\0\0À\tdesc\vbuffer\1\0\4\vbuffer\0\vnowait\2\tdesc\0\vsilent\2\6n\bset\vkeymap\bvimì\1\1\1\b\0\15\0\0256\1\0\0'\3\1\0B\1\2\0029\2\2\0019\2\3\0029\2\4\2\18\4\0\0B\2\2\0013\2\5\0\18\3\2\0'\5\6\0009\6\a\0019\6\b\0069\6\t\6'\a\n\0B\3\4\1\18\3\2\0'\5\v\0009\6\a\0019\6\f\0069\6\r\6'\a\14\0B\3\4\0012\0\0€K\0\1\0\21Close / collapse\17parent_close\rnavigate\6h\18Open / expand\tedit\topen\tnode\6l\0\22default_on_attach\rmappings\vconfig\18nvim-tree.api\frequire”\2\1\0\6\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0'\4\15\0005\5\16\0B\0\5\1K\0\1\0\1\0\2\tdesc\21Toggle file tree\vsilent\2\28<cmd>NvimTreeToggle<CR>\14<leader>E\6n\bset\vkeymap\bvim\14on_attach\0\ffilters\1\0\1\rdotfiles\1\tview\1\0\3\14on_attach\0\ffilters\0\tview\0\1\0\1\nwidth\3#\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n™\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\4\14highlight\0\21ensure_installed\0\vindent\0\17auto_install\2\1\f\0\0\blua\vpython\15javascript\15typescript\tbash\tjson\tyaml\ttoml\rmarkdown\thtml\bcss\nsetup\27nvim-treesitter.config\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["opencode.nvim"] = {
    config = { "\27LJ\2\nT\0\4\n\0\5\0\n6\4\0\0009\4\1\0049\4\2\4\18\6\0\0\18\a\1\0\18\b\2\0005\t\3\0=\3\4\tB\4\5\1K\0\1\0\tdesc\1\0\2\tdesc\0\vsilent\2\bset\vkeymap\bvim7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vtoggle\ropencode\frequire4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bask\ropencode\frequire7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vselect\ropencode\frequire@\0\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0D\0\2\0\v@this \roperator\ropencode\frequireN\0\0\3\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\2'\1\4\0&\0\1\0L\0\2\0\6_\v@this \roperator\ropencode\frequireQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\25session.half.page.up\fcommand\ropencode\frequireS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\27session.half.page.down\fcommand\ropencode\frequire¾\4\1\0\a\0&\00086\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0005\1\a\0005\2\5\0004\3\0\0=\3\6\2=\2\b\1=\1\4\0003\0\t\0\18\1\0\0005\3\n\0'\4\v\0003\5\f\0'\6\r\0B\1\5\1\18\1\0\0005\3\14\0'\4\15\0003\5\16\0'\6\17\0B\1\5\1\18\1\0\0005\3\18\0'\4\19\0003\5\20\0'\6\21\0B\1\5\1\18\1\0\0005\3\22\0'\4\23\0003\5\24\0'\6\25\0B\1\5\1\18\1\0\0'\3\26\0'\4\27\0003\5\28\0'\6\29\0B\1\5\1\18\1\0\0005\3\30\0'\4\31\0003\5 \0'\6!\0B\1\5\1\18\1\0\0005\3\"\0'\4#\0003\5$\0'\6%\0B\1\5\1K\0\1\0\25Scroll opencode down\0\f<S-C-d>\1\3\0\0\6n\6t\23Scroll opencode up\0\f<S-C-u>\1\3\0\0\6n\6t\26Send line to opencode\0\bgoo\6n\27Send range to opencode\0\ago\1\3\0\0\6n\6x\27Select opencode action\0\15<leader>os\1\3\0\0\6n\6x\17Ask opencode\0\15<leader>oa\1\3\0\0\6n\6x\20Toggle opencode\0\15<leader>oo\1\3\0\0\6n\6x\0\rprovider\1\0\1\rprovider\0\rterminal\1\0\2\rterminal\0\fenabled\rterminal\18opencode_opts\6g\rautoread\6o\bvim\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/opencode.nvim",
    url = "https://github.com/nickjvandyke/opencode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nV\0\3\t\0\6\0\n6\3\0\0009\3\1\0039\3\2\3'\5\3\0\18\6\0\0\18\a\1\0005\b\4\0=\2\5\bB\3\5\1K\0\1\0\tdesc\1\0\2\tdesc\0\vsilent\2\6n\bset\vkeymap\bvim†\4\1\0\a\0\26\0(6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3B\1\2\0019\1\b\0'\3\t\0B\1\2\0013\1\n\0\18\2\1\0'\4\v\0'\5\f\0'\6\r\0B\2\4\1\18\2\1\0'\4\14\0'\5\15\0'\6\16\0B\2\4\1\18\2\1\0'\4\17\0'\5\18\0'\6\19\0B\2\4\1\18\2\1\0'\4\20\0'\5\21\0'\6\22\0B\2\4\1\18\2\1\0'\4\23\0'\5\24\0'\6\25\0B\2\4\1K\0\1\0\17Recent files <cmd>Telescope oldfiles<CR>\15<leader>fr\14Help tags!<cmd>Telescope help_tags<CR>\15<leader>fh\fBuffers\31<cmd>Telescope buffers<CR>\15<leader>fb\14Live grep!<cmd>Telescope live_grep<CR>\15<leader>fg\15Find files\"<cmd>Telescope find_files<CR>\15<leader>ff\0\bfzf\19load_extension\rdefaults\1\0\1\rdefaults\0\fpreview\1\0\1\fpreview\0\1\0\1\15treesitter\1\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nÇ\1\0\0\4\0\a\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0004\2\4\0005\3\4\0>\3\1\0025\3\5\0>\3\2\0025\3\6\0>\3\3\2B\0\2\1K\0\1\0\1\2\1\0\14<leader>g\ngroup\bGit\1\2\1\0\14<leader>c\ngroup\15Code / LSP\1\2\1\0\14<leader>f\ngroup\21Find (Telescope)\badd\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/talos/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nV\0\3\t\0\6\0\n6\3\0\0009\3\1\0039\3\2\3'\5\3\0\18\6\0\0\18\a\1\0005\b\4\0=\2\5\bB\3\5\1K\0\1\0\tdesc\1\0\2\tdesc\0\vsilent\2\6n\bset\vkeymap\bvimî\2\1\0\6\0\18\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0004\4\3\0005\5\3\0>\5\1\4=\4\5\3=\3\a\2B\0\2\0013\0\b\0\18\1\0\0'\3\t\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\f\0'\4\r\0'\5\14\0B\1\4\1\18\1\0\0'\3\15\0'\4\16\0'\5\17\0B\1\4\1K\0\1\0\17Close buffer\21<cmd>bdelete<CR>\15<leader>bd\16Next buffer!<cmd>BufferLineCycleNext<CR>\n<S-l>\16Prev buffer!<cmd>BufferLineCyclePrev<CR>\n<S-h>\0\foptions\1\0\1\foptions\0\foffsets\1\0\1\foffsets\0\1\0\3\ttext\nFiles\fpadding\3\1\rfiletype\rNvimTree\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nw\0\3\n\1\a\0\f6\3\0\0009\3\1\0039\3\2\3'\5\3\0\18\6\0\0\18\a\1\0005\b\4\0-\t\0\0=\t\5\b=\2\6\bB\3\5\1K\0\1\0\0À\tdesc\vbuffer\1\0\4\vbuffer\0\vnowait\2\tdesc\0\vsilent\2\6n\bset\vkeymap\bvimì\1\1\1\b\0\15\0\0256\1\0\0'\3\1\0B\1\2\0029\2\2\0019\2\3\0029\2\4\2\18\4\0\0B\2\2\0013\2\5\0\18\3\2\0'\5\6\0009\6\a\0019\6\b\0069\6\t\6'\a\n\0B\3\4\1\18\3\2\0'\5\v\0009\6\a\0019\6\f\0069\6\r\6'\a\14\0B\3\4\0012\0\0€K\0\1\0\21Close / collapse\17parent_close\rnavigate\6h\18Open / expand\tedit\topen\tnode\6l\0\22default_on_attach\rmappings\vconfig\18nvim-tree.api\frequire”\2\1\0\6\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0'\4\15\0005\5\16\0B\0\5\1K\0\1\0\1\0\2\tdesc\21Toggle file tree\vsilent\2\28<cmd>NvimTreeToggle<CR>\14<leader>E\6n\bset\vkeymap\bvim\14on_attach\0\ffilters\1\0\1\rdotfiles\1\tview\1\0\3\14on_attach\0\ffilters\0\tview\0\1\0\1\nwidth\3#\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\fconform\frequire£\4\1\0\6\0\31\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\20\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\21\0025\3\22\0=\3\23\2B\0\2\0016\0\24\0009\0\25\0009\0\26\0'\2\27\0'\3\28\0003\4\29\0005\5\30\0B\0\5\1K\0\1\0\1\0\2\tdesc\16Format file\vsilent\2\0\14<leader>f\6n\bset\vkeymap\bvim\19format_on_save\1\0\2\15timeout_ms\3ô\3\17lsp_fallback\2\21formatters_by_ft\1\0\2\19format_on_save\0\21formatters_by_ft\0\rmarkdown\1\2\0\0\rprettier\bcss\1\2\0\0\rprettier\thtml\1\2\0\0\rprettier\tjson\1\2\0\0\rprettier\15typescript\1\2\0\0\rprettier\15javascript\1\2\0\0\rprettier\vpython\1\2\0\0\nblack\blua\1\0\b\vpython\0\thtml\0\rmarkdown\0\tjson\0\bcss\0\15javascript\0\15typescript\0\blua\0\1\2\0\0\vstylua\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nµ\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\2B\0\2\1K\0\1\0\nsigns\1\0\1\nsigns\0\vdelete\1\0\1\ttext\5\vchange\1\0\1\ttext\bâ–Ž\badd\1\0\3\badd\0\vdelete\0\vchange\0\1\0\1\ttext\bâ–Ž\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n™\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\4\14highlight\0\21ensure_installed\0\vindent\0\17auto_install\2\1\f\0\0\blua\vpython\15javascript\15typescript\tbash\tjson\tyaml\ttoml\rmarkdown\thtml\bcss\nsetup\27nvim-treesitter.config\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nV\0\3\t\0\6\0\n6\3\0\0009\3\1\0039\3\2\3'\5\3\0\18\6\0\0\18\a\1\0005\b\4\0=\2\5\bB\3\5\1K\0\1\0\tdesc\1\0\2\tdesc\0\vsilent\2\6n\bset\vkeymap\bvim†\4\1\0\a\0\26\0(6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3B\1\2\0019\1\b\0'\3\t\0B\1\2\0013\1\n\0\18\2\1\0'\4\v\0'\5\f\0'\6\r\0B\2\4\1\18\2\1\0'\4\14\0'\5\15\0'\6\16\0B\2\4\1\18\2\1\0'\4\17\0'\5\18\0'\6\19\0B\2\4\1\18\2\1\0'\4\20\0'\5\21\0'\6\22\0B\2\4\1\18\2\1\0'\4\23\0'\5\24\0'\6\25\0B\2\4\1K\0\1\0\17Recent files <cmd>Telescope oldfiles<CR>\15<leader>fr\14Help tags!<cmd>Telescope help_tags<CR>\15<leader>fh\fBuffers\31<cmd>Telescope buffers<CR>\15<leader>fb\14Live grep!<cmd>Telescope live_grep<CR>\15<leader>fg\15Find files\"<cmd>Telescope find_files<CR>\15<leader>ff\0\bfzf\19load_extension\rdefaults\1\0\1\rdefaults\0\fpreview\1\0\1\fpreview\0\1\0\1\15treesitter\1\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: opencode.nvim
time([[Config for opencode.nvim]], true)
try_loadstring("\27LJ\2\nT\0\4\n\0\5\0\n6\4\0\0009\4\1\0049\4\2\4\18\6\0\0\18\a\1\0\18\b\2\0005\t\3\0=\3\4\tB\4\5\1K\0\1\0\tdesc\1\0\2\tdesc\0\vsilent\2\bset\vkeymap\bvim7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vtoggle\ropencode\frequire4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bask\ropencode\frequire7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vselect\ropencode\frequire@\0\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0D\0\2\0\v@this \roperator\ropencode\frequireN\0\0\3\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\2'\1\4\0&\0\1\0L\0\2\0\6_\v@this \roperator\ropencode\frequireQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\25session.half.page.up\fcommand\ropencode\frequireS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\27session.half.page.down\fcommand\ropencode\frequire¾\4\1\0\a\0&\00086\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0005\1\a\0005\2\5\0004\3\0\0=\3\6\2=\2\b\1=\1\4\0003\0\t\0\18\1\0\0005\3\n\0'\4\v\0003\5\f\0'\6\r\0B\1\5\1\18\1\0\0005\3\14\0'\4\15\0003\5\16\0'\6\17\0B\1\5\1\18\1\0\0005\3\18\0'\4\19\0003\5\20\0'\6\21\0B\1\5\1\18\1\0\0005\3\22\0'\4\23\0003\5\24\0'\6\25\0B\1\5\1\18\1\0\0'\3\26\0'\4\27\0003\5\28\0'\6\29\0B\1\5\1\18\1\0\0005\3\30\0'\4\31\0003\5 \0'\6!\0B\1\5\1\18\1\0\0005\3\"\0'\4#\0003\5$\0'\6%\0B\1\5\1K\0\1\0\25Scroll opencode down\0\f<S-C-d>\1\3\0\0\6n\6t\23Scroll opencode up\0\f<S-C-u>\1\3\0\0\6n\6t\26Send line to opencode\0\bgoo\6n\27Send range to opencode\0\ago\1\3\0\0\6n\6x\27Select opencode action\0\15<leader>os\1\3\0\0\6n\6x\17Ask opencode\0\15<leader>oa\1\3\0\0\6n\6x\20Toggle opencode\0\15<leader>oo\1\3\0\0\6n\6x\0\rprovider\1\0\1\rprovider\0\rterminal\1\0\2\rterminal\0\fenabled\rterminal\18opencode_opts\6g\rautoread\6o\bvim\0", "config", "opencode.nvim")
time([[Config for opencode.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bibl\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3\1\0B\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3\1\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleÜ\4\1\0\f\0\"\0>6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0019\2\5\0005\4\t\0005\5\a\0003\6\6\0=\6\b\5=\5\n\0049\5\v\0009\5\f\0059\5\r\0055\a\15\0009\b\v\0009\b\14\bB\b\1\2=\b\16\a9\b\v\0009\b\17\bB\b\1\2=\b\18\a9\b\v\0009\b\19\b5\n\20\0B\b\2\2=\b\21\a9\b\v\0003\n\22\0005\v\23\0B\b\3\2=\b\24\a9\b\v\0003\n\25\0005\v\26\0B\b\3\2=\b\27\aB\5\2\2=\5\v\0049\5\28\0009\5\29\0054\a\5\0005\b\30\0>\b\1\a5\b\31\0>\b\2\a5\b \0>\b\3\a5\b!\0>\b\4\aB\5\2\2=\5\29\4B\2\2\0012\0\0€K\0\1\0\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\1\0\5\f<S-Tab>\0\n<Tab>\0\t<CR>\0\n<C-e>\0\14<C-Space>\0\rcomplete\vinsert\vpreset\fmapping\fsnippet\1\0\3\fmapping\0\fsnippet\0\fsources\0\vexpand\1\0\1\vexpand\0\0\nsetup\14lazy_load luasnip.loaders.from_vscode\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nÇ\1\0\0\4\0\a\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0004\2\4\0005\3\4\0>\3\1\0025\3\5\0>\3\2\0025\3\6\0>\3\3\2B\0\2\1K\0\1\0\1\2\1\0\14<leader>g\ngroup\bGit\1\2\1\0\14<leader>c\ngroup\15Code / LSP\1\2\1\0\14<leader>f\ngroup\21Find (Telescope)\badd\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nw\0\3\n\1\b\0\r6\3\0\0009\3\1\0039\3\2\3'\5\3\0\18\6\0\0\18\a\1\0005\b\5\0-\t\0\0009\t\4\t=\t\6\b=\2\a\bB\3\5\1K\0\1\0\0À\tdesc\vbuffer\1\0\3\vbuffer\0\tdesc\0\vsilent\2\bbuf\6n\bset\vkeymap\bvim˜\5\1\1\a\0#\0P3\1\0\0\18\2\1\0'\4\1\0006\5\2\0009\5\3\0059\5\4\0059\5\5\5'\6\6\0B\2\4\1\18\2\1\0'\4\a\0006\5\2\0009\5\3\0059\5\4\0059\5\b\5'\6\t\0B\2\4\1\18\2\1\0'\4\n\0006\5\2\0009\5\3\0059\5\4\0059\5\v\5'\6\f\0B\2\4\1\18\2\1\0'\4\r\0006\5\2\0009\5\3\0059\5\4\0059\5\14\5'\6\15\0B\2\4\1\18\2\1\0'\4\16\0006\5\2\0009\5\3\0059\5\4\0059\5\17\5'\6\18\0B\2\4\1\18\2\1\0'\4\19\0006\5\2\0009\5\3\0059\5\4\0059\5\20\5'\6\21\0B\2\4\1\18\2\1\0'\4\22\0006\5\2\0009\5\3\0059\5\4\0059\5\23\5'\6\24\0B\2\4\1\18\2\1\0'\4\25\0006\5\2\0009\5\26\0059\5\27\5'\6\28\0B\2\4\1\18\2\1\0'\4\29\0006\5\2\0009\5\26\0059\5\30\5'\6\31\0B\2\4\1\18\2\1\0'\4 \0006\5\2\0009\5\26\0059\5!\5'\6\"\0B\2\4\0012\0\0€K\0\1\0\20Next diagnostic\14goto_next\a]d\24Previous diagnostic\14goto_prev\a[d\20Show diagnostic\15open_float\15diagnostic\14<leader>d\16Code action\16code_action\15<leader>ca\18Rename symbol\vrename\15<leader>rn\15Hover docs\nhover\6K\25Go to implementation\19implementation\agi\15References\15references\agr\22Go to declaration\16declaration\agD\21Go to definition\15definition\bbuf\blsp\bvim\agd\0ü\4\1\0\n\0!\0:6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\0015\0\4\0006\1\0\0'\3\5\0B\1\2\0029\1\2\0015\3\6\0=\0\a\3B\1\2\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0005\4\r\0003\5\f\0=\5\14\4B\1\3\0016\1\0\0'\3\15\0B\1\2\0029\1\16\1B\1\1\0026\2\b\0009\2\17\0029\2\18\2'\4\19\0005\5\20\0=\1\21\5B\2\3\0016\2\b\0009\2\17\0029\2\18\2'\4\22\0005\5\30\0005\6\28\0005\a\26\0005\b\24\0005\t\23\0=\t\25\b=\b\27\a=\a\29\6=\6\31\5B\2\3\0016\2\b\0009\2\17\0029\2 \2\18\4\0\0B\2\2\1K\0\1\0\venable\rsettings\1\0\1\rsettings\0\bLua\1\0\1\bLua\0\16diagnostics\1\0\1\16diagnostics\0\fglobals\1\0\1\fglobals\0\1\2\0\0\bvim\vlua_ls\17capabilities\1\0\1\17capabilities\0\6*\vconfig\blsp\25default_capabilities\17cmp_nvim_lsp\rcallback\1\0\1\rcallback\0\0\14LspAttach\24nvim_create_autocmd\bapi\bvim\21ensure_installed\1\0\2\27automatic_installation\2\21ensure_installed\0\20mason-lspconfig\1\b\0\0\vlua_ls\fpyright\nts_ls\vbashls\vjsonls\ncssls\thtml\vfidget\nsetup\nmason\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\a\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\1\5\1\18\3\1\0009\1\6\1'\4\a\0009\5\b\0B\5\1\0A\1\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
