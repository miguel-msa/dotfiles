return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"sqlfluff",
				"gopls",
				"vtsls",
				"vue_ls",
				"terraformls",
				"bashls",
				"ltex",
				"roslyn",
			},
		})
	end,
}
