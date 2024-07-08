-- https://github.com/williamboman/mason.nvim
-- :Mason
require'mason'.setup({
  opts = {
    ensure_installed = {
      "rust-analyzer",
    },
  },
})
