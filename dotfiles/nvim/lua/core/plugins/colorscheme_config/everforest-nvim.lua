return {
    "neanias/everforest-nvim",
    --version = false,
    lazy = false,
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true
        vim.g.everforest_enable_italic = true
        vim.g.everforest_background = "medium" -- Example of another option
        vim.cmd.colorscheme("everforest")
    end,
}
--    require("everforest").setup({
--      -- Your config here
--    })
