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
  -- Colorscheme(s)
  'rebelot/kanagawa.nvim',
  'EdenEast/nightfox.nvim',
  'rose-pine/neovim',

  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',

  'stevearc/oil.nvim',

  'nvim-lualine/lualine.nvim',

  "zbirenbaum/copilot.lua",

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
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  {
    "nvimdev/lspsaga.nvim",
 
	  -- 'nvim-telescope/telescope.nvim',
	  -- tag = '0.1.0',
			--
	  -- dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  'onsails/lspkind.nvim',

  -- Session Manager
  "rmagatti/auto-session",

  -- Useful plugin to show pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  
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

  -- Add indentation guides even on blank lines
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure to have the system
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- harpoon
  --'ThePrimeagen/harpoon',

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
     'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- alpha nvim
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  },
}
local opts = {}

require('lazy').setup(
  plugins,
  opts
)
