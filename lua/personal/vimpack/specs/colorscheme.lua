return {
    enabled = true,
    specs = {
        {
            src = "https://github.com/rose-pine/neovim",
            name = "rose-pine",
            data = {
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
        }
    },
    setup = function()
        require("rose-pine").setup(vim.pack.get({"rose-pine"})[1].spec.data)
    end
}
