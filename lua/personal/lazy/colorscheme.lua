local utils = require("personal.utils")

return {
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 9999,
        config = function()
            require("rose-pine").setup({
                variant = "moon",
                enable = {
                    terminal = true
                },
                dim_inactive_windows = false,
                styles = {
                    bold = false,
                    italic = false,
                    transparency = false,
                },
                highlight_groups = {
                    Comment = { italic = true }
                }
            })
        end,
        keys = {
            {
                '<leader>1',
                mode = 'n',
                desc = 'colorscheme: set rose-pine',
                function()
                    utils.color_me({ color = "rose-pine" })
                end,
            },
            {
                '<leader>2',
                mode = 'n',
                desc = 'colorscheme: set quiet',
                function()
                    utils.color_me({ color = "quiet" })
                end,
            },
            {
                '<leader>9',
                mode = 'n',
                desc = 'colorscheme: set bg solid',
                function()
                    utils.solid_bg()
                end,
            },
            {
                '<leader>0',
                mode = 'n',
                desc = 'colorscheme: set bg tranparent',
                function()
                    utils.transparent_bg()
                end,
            },
        }
    }
}
