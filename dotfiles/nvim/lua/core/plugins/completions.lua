----local cmp_autopairs = require('nvim-autopairs.completion.cmp')
--local cmp = require("cmp")
--local lspkind = require("lspkind")
--
--require("luasnip.loaders.from_vscode").lazy_load()
--
----cmp.event:on(
----  'confirm_done',
----
----  cmp_autopairs.on_confirm_done()
----)
--
--cmp.setup({
--  mapping = cmp.mapping.preset.insert({
--      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--      ['<C-f>'] = cmp.mapping.scroll_docs(4),
--      ['<C-o>'] = cmp.mapping.complete(),
--      ['<C-e>'] = cmp.mapping.abort(),
--      ['<CR>'] = cmp.mapping.confirm({ select = true }),
--
--    }),
--  snippet = {
--    expand = function(args)
--      local cleaned_body = args.body:gsub("%${%d+:([^}]+)}", "%1"):gsub("%${%d+}", "")
--      require('luasnip').lsp_expand(cleaned_body)
--      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left><Left>", true, false, true), "n", false)
--      --require('luasnip').lsp_expand(args.body)
--    end,
--  },
--  sources = cmp.config.sources({
--    { name = 'nvim_lsp' },
--    { name = 'luasnip' },
--  }, {
--    { name = 'buffer' },
--  }),
--  formatting = {
--    format = lspkind.cmp_format({
--      mode = "symbol",
--      menu = ({
--        buffer = "[Buffer]",
--        nvim_lsp = "[LSP]",
--        luasnip = "[LuaSnip]",
--        nvim_lua = "[Lua]",
--        latex_symbols = "[Latex]",
--      })
--    }),
--  },
--  window = {
--    completion = cmp.config.window.bordered(),
--    documentation = cmp.config.window.bordered()
--  }
--})
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noinsert",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
