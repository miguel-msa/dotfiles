return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AlexvZyl/nordic.nvim",
  },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")
    -- pull in nordic colors from the nordic.nvim palette
    --local nordic = require("nordic.colors")
    local colors = {
      blue        = "#81A1C1",  -- default Nordic blue
      green       = "#A3BE8C",  -- Nordic green
      violet      = "#B48EAD",  -- Nordic purple (used as violet)
      yellow      = "#EBCB8B",  -- Nordic yellow
      red         = "#BF616A",  -- Nordic red
      fg          = "#D8DEE9",  -- foreground
      bg          = "#2E3440",  -- background
      inactive_bg = "#3B4252", -- fallback inactive background
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue,  fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg,    fg = colors.fg },
        c = { bg = colors.bg,    fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg,    fg = colors.fg },
        c = { bg = colors.bg,    fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg,     fg = colors.fg },
        c = { bg = colors.bg,     fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg,     fg = colors.fg },
        c = { bg = colors.bg,     fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red,    fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg,     fg = colors.fg },
        c = { bg = colors.bg,     fg = colors.fg },
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
