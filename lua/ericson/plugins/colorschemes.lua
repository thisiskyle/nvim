return {

    {
        "rose-pine/neovim",
        config = function()
            require("rose-pine").setup({
                variant = "moon",
                transparent = true,
                enable = {
                    terminal = true
                },
                styles = {
                    bold = true,
                    italic = false,
                    transparency = true,
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
                    vim.cmd.colorscheme("rose-pine-moon")
                end,
                mode = 'n'
            },

            {
                '<leader>2',
                function()
                    require("rose-pine").setup({ styles = { transparency = true } })
                    vim.cmd.colorscheme("rose-pine-moon")
                end,
                mode = 'n'
            },
            {
                '<leader>3',
                function()
                    vim.o.background = "light"
                    vim.cmd.colorscheme("quiet")
                end,
                mode = 'n'
            },
        }
    },
}
