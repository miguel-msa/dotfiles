return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"AlexvZyl/nordic.nvim",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		-- Kanagawa dragon colors (currently active)
		local colors = {
			blue = "#7E9CD8", -- Kanagawa dragon blue
			green = "#98BB6C", -- Kanagawa dragon green
			violet = "#938AA9", -- Kanagawa dragon purple
			yellow = "#E6C384", -- Kanagawa dragon yellow
			red = "#C4746E", -- Kanagawa dragon red
			fg = "#C5C9C5", -- Kanagawa dragon foreground
			bg = "#181616", -- Kanagawa dragon background
			inactive_bg = "#282727", -- Kanagawa dragon inactive background
		}

		-- Catppuccin colors (commented for later use)
		--local catppuccin_colors = {
		--  blue        = "#89B4FA",  -- Catppuccin blue
		--  green       = "#A6E3A1",  -- Catppuccin green
		--  violet      = "#CBA6F7",  -- Catppuccin purple
		--  yellow      = "#F9E2AF",  -- Catppuccin yellow
		--  red         = "#F38BA8",  -- Catppuccin red
		--  fg          = "#CDD6F4",  -- Catppuccin foreground
		--  bg          = "#1E1E2E",  -- Catppuccin background
		--  inactive_bg = "#313244",  -- Catppuccin inactive background
		--}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.fg },
				c = { bg = colors.inactive_bg, fg = colors.fg },
			},
		}

		lualine.setup({
			options = {
				theme = my_lualine_theme,
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#D08770" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
