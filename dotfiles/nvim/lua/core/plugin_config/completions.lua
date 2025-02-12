local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require("cmp")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.event:on(
  'confirm_done',

  cmp_autopairs.on_confirm_done()
)

cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),

    }),
  snippet = {
    expand = function(args)
      local cleaned_body = args.body:gsub("%${%d+:([^}]+)}", "%1"):gsub("%${%d+}", "")
      require('luasnip').lsp_expand(cleaned_body)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left><Left>", true, false, true), "n", false)
      --require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol",
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      })
    }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  }
})
