local utils = require("ericson.utils")

return {
    sources = {
        {
            src = "https://github.com/rose-pine/neovim",
            name = "rose-pine"
        }
    },
    setup = function()

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


        vim.keymap.set(
            { 'n' },
            '<leader>1',
            function()
                utils.color_me({ color = "rose-pine" })
            end,
            { desc = 'colorscheme: set rose-pine' }
        )
        vim.keymap.set(
            { 'n' },
            '<leader>2',
            function()
                utils.color_me({ color = "quiet" })
            end,
            { desc = 'colorscheme: set quiet' }
        )
        vim.keymap.set(
            { 'n' },
            '<leader>9',
            function()
                utils.solid_bg()
            end,
            { desc = 'colorscheme: set bg solid' }
        )
        vim.keymap.set(
            { 'n' },
            '<leader>0',
            function()
                utils.transparent_bg()
            end,
            { desc = 'colorscheme: set bg tranparent' }
        )

    end
}

