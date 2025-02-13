
local dark = {
    variant = "moon",
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
}

local light = {
    variant = "dawn",
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
}

local clear = {
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
            require("rose-pine").setup(dark)
            vim.cmd.colorscheme("rose-pine")
        end,
        keys = {
            {
                '<leader>1',
                function()
                    require("rose-pine").setup(dark)
                    vim.cmd.colorscheme("rose-pine")
                end,
                mode = 'n'
            },
            {
                '<leader>2',
                function()
                    require("rose-pine").setup(clear)
                    vim.cmd.colorscheme("rose-pine")
                end,
                mode = 'n'
            },
            {
                '<leader>3',
                function()
                    require("rose-pine").setup(light)
                    vim.cmd.colorscheme("rose-pine")
                end,
                mode = 'n'
            },
        }
    },
}
