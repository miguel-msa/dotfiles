require('telescope').setup()
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<Space>sa', builtin.live_grep, {})

vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})

vim.keymap.set('n', '<Space>ds', builtin.lsp_document_symbols, {})
