return {
    enabled = true,
    specs = {
        {
            src ="https://github.com/rose-pine/neovim",
            data = {
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
                end
            }
        }
    },
}
