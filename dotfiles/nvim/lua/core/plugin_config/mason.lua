-- https://github.com/williamboman/mason.nvim
-- :Mason
-- :MasonInstall <name>
require'mason'.setup({
  opts = {
    ensure_installed = {
      "lua-language-server",
      "rust-analyzer",
      "gopls",
      "golines",
      "goimports",
      "gofumpt",
      "typescript-language-server",
      "vue-language-server",
    },
  },
})