return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"ruff", -- python linter
				"eslint_d",
				"sqlfluff",
				"sql-formatter",
				"roslyn",
				"csharpier",
			},
		})
	end,
}
