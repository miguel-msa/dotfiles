-- disabled: fix config
require'crates'.setup({
  ft = {"rust", "toml"},
  config = function(_, opts)
    local crates = require('crates')
    crates.setup(opts)
    crates.show()
  end,
})
