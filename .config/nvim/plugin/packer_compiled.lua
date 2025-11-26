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
local package_path_str = "/Users/joel/.cache/nvim/packer_hererocks/2.1.1763318511/share/lua/5.1/?.lua;/Users/joel/.cache/nvim/packer_hererocks/2.1.1763318511/share/lua/5.1/?/init.lua;/Users/joel/.cache/nvim/packer_hererocks/2.1.1763318511/lib/luarocks/rocks-5.1/?.lua;/Users/joel/.cache/nvim/packer_hererocks/2.1.1763318511/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/joel/.cache/nvim/packer_hererocks/2.1.1763318511/lib/lua/5.1/?.so"
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
  LuaSnip = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/luasnip\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/aerial\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/stevearc/aerial.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/famiu/bufdelete.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/bufferline\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/akinsho/bufferline.nvim"
  },
  ["cmake-tools.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31archvim/config/cmake-tools\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmake-tools.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/Civitasv/cmake-tools.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-cmdline"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/lukas-reineke/cmp-rg"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/f3fora/cmp-spell"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/saadparwaiz1/cmp_luasnip"
  },
  ["diagflow.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/diagflow\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/diagflow.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/dgagn/diagflow.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/sindrets/diffview.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/stevearc/dressing.nvim"
  },
  ["fcitx.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/fcitx.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/h-hg/fcitx.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/rafamadriz/friendly-snippets"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/ibhagwan/fzf-lua"
  },
  ["genius.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/genius\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/genius.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/archibate/genius.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/gitsigns\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/lewis6991/gitsigns.nvim"
  },
  gpt4o = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/gpt4o",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/archibate/gpt4o"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/ellisonleao/gruvbox.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23archvim/config/hop\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/phaazon/hop.nvim"
  },
  ["inc-rename.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15inc_rename\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/inc-rename.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/smjonas/inc-rename.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!archvim/config/lsp-signature\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    cond = { "\27LJ\2\n>\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\0\2\0L\0\2\0\15nerd_fonts\20archvim.options\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/opt/lspkind-nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/onsails/lspkind-nvim"
  },
  ["lualine-time"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/lualine-time",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/archibate/lualine-time"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/lualine\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/rktjmp/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0-let g:mkdp_browser = '/usr/bin/chromium'\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/williamboman/mason-lspconfig.nvim"
  },
  ["mason-registry"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/mason-registry",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/mason-org/mason-registry"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25archvim/config/mason\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/williamboman/mason.nvim"
  },
  ["mathjax-support-for-mkdp"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/mathjax-support-for-mkdp",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/iamcco/mathjax-support-for-mkdp"
  },
  ["md-img-paste.vim"] = {
    config = { "\27LJ\2\n—\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0±\1let g:mdip_imgdir = 'img' \" save image in ./img\nlet g:mdip_imgname = 'image'\nautocmd FileType markdown nnoremap <silent> mp :call mdip#MarkdownClipboardImage()<CR>\n        \bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/opt/md-img-paste.vim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/ferrine/md-img-paste.vim"
  },
  neoformat = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/neoformat\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/sbdchd/neoformat"
  },
  neogit = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/neogit",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/NeogitOrg/neogit"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/shaunsingh/nord.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/nvim-cmp\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 archvim/config/nvim-comment\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/terrortylor/nvim-comment"
  },
  ["nvim-lastplace"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/ethanholz/nvim-lastplace"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/notify\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!archvim/config/nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/kylechui/nvim-surround"
  },
  ["nvim-toggler"] = {
    config = { "\27LJ\2\nç\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\29autoselect_longest_match\1\28remove_default_inverses\1\28remove_default_keybinds\2\nsetup\17nvim-toggler\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-toggler",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nguyenvukhang/nvim-toggler"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treehopper"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-treehopper",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/mfussenegger/nvim-treehopper"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#archvim/config/nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    cond = { "\27LJ\2\n>\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\0\2\0L\0\2\0\15nerd_fonts\20archvim.options\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-tree/nvim-web-devicons"
  },
  ouroboros = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/ouroboros",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/jakemason/ouroboros"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-lua/popup.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/BurntSushi/ripgrep"
  },
  ["scope.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nscope\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/scope.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/tiagovla/scope.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/tami5/sqlite.lua"
  },
  ["stickybuf.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stickybuf\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/stickybuf.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/stevearc/stickybuf.nvim"
  },
  ["telescope-changes.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/telescope-changes.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/LinArcX/telescope-changes.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/telescope\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/trouble\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/twilight\frequire\0" },
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/folke/twilight.nvim"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/andymass/vim-matchup"
  },
  ["vim-pio"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/vim-pio",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/normen/vim-pio"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/folke/zen-mode.nvim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/Users/joel/.local/share/nvim/site/pack/packer/start/zephyr-nvim",
    url = "/Users/joel/.config/nvim/lua/archvim/predownload/glepnir/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/notify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#archvim/config/nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0", "config", "nvim-lastplace")
time([[Config for nvim-lastplace]], false)
-- Config for: cmake-tools.nvim
time([[Config for cmake-tools.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31archvim/config/cmake-tools\frequire\0", "config", "cmake-tools.nvim")
time([[Config for cmake-tools.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23archvim/config/hop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/nvim-cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!archvim/config/nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/luasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25archvim/config/mason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!archvim/config/lsp-signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: diagflow.nvim
time([[Config for diagflow.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/diagflow\frequire\0", "config", "diagflow.nvim")
time([[Config for diagflow.nvim]], false)
-- Config for: neoformat
time([[Config for neoformat]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/neoformat\frequire\0", "config", "neoformat")
time([[Config for neoformat]], false)
-- Config for: genius.nvim
time([[Config for genius.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/genius\frequire\0", "config", "genius.nvim")
time([[Config for genius.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/trouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 archvim/config/nvim-comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/aerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/twilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: nvim-toggler
time([[Config for nvim-toggler]], true)
try_loadstring("\27LJ\2\nç\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\29autoselect_longest_match\1\28remove_default_inverses\1\28remove_default_keybinds\2\nsetup\17nvim-toggler\frequire\0", "config", "nvim-toggler")
time([[Config for nvim-toggler]], false)
-- Config for: inc-rename.nvim
time([[Config for inc-rename.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15inc_rename\frequire\0", "config", "inc-rename.nvim")
time([[Config for inc-rename.nvim]], false)
-- Config for: scope.nvim
time([[Config for scope.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nscope\frequire\0", "config", "scope.nvim")
time([[Config for scope.nvim]], false)
-- Config for: stickybuf.nvim
time([[Config for stickybuf.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stickybuf\frequire\0", "config", "stickybuf.nvim")
time([[Config for stickybuf.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Conditional loads
time([[Conditional loading of nvim-web-devicons]], true)
  require("packer.load")({"nvim-web-devicons"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-web-devicons]], false)
time([[Conditional loading of lspkind-nvim]], true)
  require("packer.load")({"lspkind-nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lspkind-nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'md-img-paste.vim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

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
