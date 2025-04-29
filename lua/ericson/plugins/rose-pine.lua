local utils = require("ericson.utils")

return {
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 52,
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
                desc = 'color: set rose-pine',
                function()
                    utils.ColorMe({ color = "rose-pine" })
                end,
            },
            {
                '<leader>2',
                mode = 'n',
                desc = 'color: set rose-pine',
                function()
                    utils.ColorMe({ color = "quiet" })
                end,
            },
            {
                '<leader>9',
                mode = 'n',
                desc = 'color: set bg solid',
                function()
                    utils.SolidBg()
                end,
            },
            {
                '<leader>0',
                mode = 'n',
                desc = 'color: set bg tranparent',
                function()
                    utils.TransparentBg()
                end,
            },
        }
    }
}
