--return {
--    'AlexvZyl/nordic.nvim',
--    lazy = false,
--    priority = 1000,
--    config = function()
--        require('nordic').load()
--    end
--}
--return {
--	"catppuccin/nvim",
--	lazy = false,
--	name = "catppuccin",
--	priority = 1000,
--	config = function()
--		require("catppuccin").setup({
--			--flavour = "latte",
--			flavour = "mocha",
--		})
--		vim.cmd.colorscheme("catppuccin")
--	end,
--}

return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			compile = false,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = false },
			statementStyle = { bold = false },
			typeStyle = {},
			transparent = false,
			dimInactive = false,
			terminalColors = true,
			colors = {
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors)
				return {}
			end,
			theme = "dragon",
			background = {
				dark = "dragon",
				light = "lotus",
			},
		})
		vim.cmd.colorscheme("kanagawa")
	end,
}
