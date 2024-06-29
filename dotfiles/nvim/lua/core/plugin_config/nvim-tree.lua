vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    side = "right"
  }
})

vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')
