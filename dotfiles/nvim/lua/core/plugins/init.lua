--package.path = package.path .. ";~/.config/nvim/lua/?.lua;~/.config/nvim/lua/?/init.lua"
--
--require("core.plugin_config.mason")
--require("core.plugin_config.lsp_config")
--require("core.plugin_config.completions")
--require("core.plugin_config.none-ls")
--require("core.plugin_config.lualine")
--require("core.plugin_config.colorscheme_config")
--require("core.plugin_config.nvim-tree")
--require("core.plugin_config.treesitter")
--require("core.plugin_config.telescope")
--require("core.plugin_config.oil")
--require("core.plugin_config.autopairs")
--require("core.plugin_config.noice")
--require("core.plugin_config.trouble")
--require("core.plugin_config.vimtex")
--
--require("core.plugin_config.rust")
--require("core.plugin_config.crates")
--require("core.plugin_config.nvim_cmp")
--require("core.plugin_config.autotag") TODO: get it from treesitter config
--
return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
}
