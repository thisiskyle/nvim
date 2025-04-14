function ColorMe(conf)
    local c = "rose-pine-moon"
    local t = false

    if(conf) then
        c = conf.scheme or c
        t = conf.transparent or t
    end

    vim.cmd.colorscheme(c)
    if(t) then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end
end


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
            ColorMe({ transparent = true })
        end,
        keys = {
            {
                '<leader>1',
                function()
                    ColorMe()
                end,
                mode = 'n'
            },
            {
                '<leader>2',
                function()
                    ColorMe({ transparent = true })
                end,
                mode = 'n'
            },
            {
                '<leader>3',
                function()
                    ColorMe({ scheme = 'rose-pine-dawn', transparent = false })
                end,
                mode = 'n'
            },
            {
                '<leader>4',
                function()
                    ColorMe({ scheme = 'quiet', transparent = false })
                end,
                mode = 'n'
            },
        }
    },
}
