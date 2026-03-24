local _opts = {
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
        Comment = {
            italic = true
        }
    }
}

return {
    enabled = true,
    specs = {
        {
            src = "https://github.com/rose-pine/neovim",
            name = "rose-pine",
            data = _opts
        }
    },
    setup = function()
        require("rose-pine").setup(_opts)
    end
}
