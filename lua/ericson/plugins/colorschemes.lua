
local tokyo_moon = {
    style = "moon",
    transparent = false,
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
        sidebars = "normal",
        floats = "normal",
    }
}

local tokyo_clear = {
    style = "moon",
    transparent = true,
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
    }
}

local rose_moon = {
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

local rose_clear = {
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
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
            require("tokyonight").setup(tokyo_moon)
            -- vim.cmd.colorscheme("tokyonight")
        end,
        keys = {
            {
                '<leader>3',
                function()
                    require("tokyonight").setup(tokyo_moon)
                    vim.cmd.colorscheme("tokyonight")
                end,
                mode = 'n'
            },
            {
                '<leader>4',
                function()
                    require("tokyonight").setup(tokyo_clear)
                    vim.cmd.colorscheme("tokyonight")
                end,
                mode = 'n'
            },
        }
    },

    {
        "rose-pine/neovim",
        lazy = false,
        config = function()
            require("rose-pine").setup(rose_moon)
            vim.cmd.colorscheme("rose-pine")
        end,
        keys = {
            {
                '<leader>1',
                function()
                    require("rose-pine").setup(rose_moon)
                    vim.cmd.colorscheme("rose-pine")
                end,
                mode = 'n'
            },
            {
                '<leader>2',
                function()
                    require("rose-pine").setup(rose_clear)
                    vim.cmd.colorscheme("rose-pine")
                end,
                mode = 'n'
            },
        }
    },
}
