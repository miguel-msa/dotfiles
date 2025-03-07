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
  --'neanias/everforest-nvim',
  'sainnhe/gruvbox-material',
  --require("core.plugin_config.colorscheme_config.everforest-nvim"),
  --require('core.plugin_config.colorscheme_config.shadow'),
  --require("core.plugin_config.colorscheme_config.nordic"),
  --require("core.plugin_config"),

  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',

  -- Git related plugins
  'preservim/vimux',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  'tpope/vim-commentary',


  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

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
}
local opts = {}

--require("lazy").setup({ plugins, { import = "core.plugin_config.markdown-preview" } }, {
--  checker = {
--    enabled = true,
--    notify = false,
--  },
--  change_detection = {
--    notify = false,
--  },
--})

require("lazy").setup({ { import = "core.plugins" }, { import = "core.plugins.lsp"} }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
