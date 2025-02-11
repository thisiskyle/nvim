
local moon = {
    variant = "moon",
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
}

local moon_clear = {
    variant = "moon",
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
}


return {
    {
        "rose-pine/neovim",
        lazy = false,
        config = function()
            require("rose-pine").setup(moon)
            vim.cmd.colorscheme("rose-pine")
        end,

        keys = {
            {
                '<leader>1',
                function()
                    require("rose-pine").setup(moon)
                    vim.cmd.colorscheme("rose-pine")
                end,
                mode = 'n'
            },

            {
                '<leader>2',
                function()
                    require("rose-pine").setup(moon_clear)
                    vim.cmd.colorscheme("rose-pine")
                end,
                mode = 'n'
            },
        }
    },
}
