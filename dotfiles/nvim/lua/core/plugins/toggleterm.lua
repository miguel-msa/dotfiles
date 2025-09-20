return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local toggleterm = require("toggleterm")

			toggleterm.setup({
				size = function(term)
					if term.direction == "vertical" then
						return vim.o.columns * 0.4
					elseif term.direction == "horizontal" then
						return 20
					end
				end,
				open_mapping = [[<C-\>]],
				direction = "float", -- this is just the default
			})

			local Terminal = require("toggleterm.terminal").Terminal

			-- Persistent right-side terminal instance
			local right_term = Terminal:new({
				direction = "vertical",
				count = 99, -- always reuse this ID
				size = vim.o.columns * 0.4,
				close_on_exit = false, -- don't destroy the buffer on `exit`
				hidden = true, -- allow it to be toggled off
			})

			function _TOGGLE_RIGHT_TERM()
				right_term:toggle()
			end

			-- Make it togglable from both normal and terminal modes
			vim.keymap.set({ "n", "t" }, "<C-]>", _TOGGLE_RIGHT_TERM, { desc = "Toggle right terminal" })
		end,
	},
}
