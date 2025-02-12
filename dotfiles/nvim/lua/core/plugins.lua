vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = "unnamedplus"

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Nice colorschemes
  --'rebelot/kanagawa.nvim',
  'EdenEast/nightfox.nvim',
  --'rose-pine/neovim',
  --'neanias/everforest-nvim',
  'sainnhe/gruvbox-material',
  require("core.plugin_config.colorscheme_config.everforest-nvim"),
  --require('core.plugin_config.colorscheme_config.shadow'),

  "christoomey/vim-tmux-navigator",

  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',

  'stevearc/oil.nvim',

  'nvim-lualine/lualine.nvim',

  -- Git related plugins
  'preservim/vimux',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  'tpope/vim-commentary',

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter"
  },
  'windwp/nvim-ts-autotag',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Completion
  {
    'hrsh7th/nvim-cmp', -- completion engine
    -- todo: config crate autocomplete
    --opts = function()
    --    local M = require "plugins.config.cmp"
    --    table.insert(M.sources, {name = "crates"})
    --    return M
    --end,
  },
  'hrsh7th/cmp-nvim-lsp', -- lsp source
  'L3MON4D3/LuaSnip', -- snippets engine
  'saadparwaiz1/cmp_luasnip', -- luasnip completion source for nvim-cmp
  "rafamadriz/friendly-snippets", -- snippets collection

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim", -- extension to mason.nvim for lspconfig ease of use
  "neovim/nvim-lspconfig",
  {
    "nvimdev/lspsaga.nvim",
	  -- 'nvim-telescope/telescope.nvim',
	  -- tag = '0.1.0',
			--
	  -- dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  'onsails/lspkind.nvim',

  -- RUST
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  "saecki/crates.nvim",

  -- Go
  "nvimtools/none-ls.nvim",
  {
    -- todo: config this in plugin_config/gopher.lua
    -- reminder: :GoTagAdd json
    -- :GoIfErr
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },

  'folke/which-key.nvim',

  -- TODO: pass this to /plugin_config/gitsigns.lua
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  { 'nvim-telescope/telescope.nvim',
    version = '*', 
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
     'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  },

  "folke/todo-comments.nvim",
}
local opts = {}

require("lazy").setup({ plugins, { import = "core.plugin_config.markdown-preview" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
