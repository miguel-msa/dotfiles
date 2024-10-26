-- https://github.com/williamboman/mason.nvim
-- :Mason
-- :MasonInstall <name>
require'mason'.setup({
  opts = {
    ensure_installed = {
      "rust-analyzer",
      "gopls",
      "golines",
      "goimports",
      "gofumpt",
    },
  },
})
