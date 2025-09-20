return {
	"nvimdev/lspsaga.nvim",
	code_action_icon = "💡",
	symbol_in_winbar = {
		in_custom = false,
		enable = true,
		separator = " ",
		show_file = true,
		file_formatter = "",
	},

	config = function()
		require("lspsaga").setup({})
	end,

	vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", { silent = true }),
	--vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
	--vim.keymap.set({"n","t"}, "<C-w>t", "<cmd>Lspsaga term_toggle<cr>", { silent = true})
	vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true }),
	--vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<CR>", { silent = true })
	vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", { silent = true }), --<C-c>k to close

	vim.keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>"),
}
