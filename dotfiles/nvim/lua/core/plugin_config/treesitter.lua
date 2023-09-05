require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"

  ensure_installed = {
    "vim",
    "lua",
    "c", "rust",
    "java", "javascript", "typescript", "python", "c_sharp",
    "sql", "regex",
    "html", "css", "scss",
    "json", "json5", "latex", "make", "markdown", "markdown_inline", "toml", "xml", "yaml"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  autotag = {
	  enable = true
  }
}
