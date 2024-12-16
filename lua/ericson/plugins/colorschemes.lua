return {
    {
        "rose-pine/neovim",
        config = function()
            require("rose-pine").setup({
                variant = "moon",
                transparent = false,
                enable = {
                    terminal = true
                },
                styles = {
                    bold = true,
                    italic = false,
                    transparency = false,
                },
                highlight_groups = {
                    Comment = { italic = true }
                }
            })

            vim.cmd.colorscheme("rose-pine")

        end,
        keys = {
            {
                '<leader>1',
                function()
                    require("rose-pine").setup({ styles = { transparency = false } })
                    vim.cmd.colorscheme("rose-pine")
                end,
                mode = 'n'
            },

            {
                '<leader>2',
                function()
                    require("rose-pine").setup({ styles = { transparency = true } })
                    vim.cmd.colorscheme("rose-pine")
                end,
                mode = 'n'
            },
        }
    },
}
