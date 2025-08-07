function Color_Me(conf)
    local c = conf.color or "default"
    vim.cmd.colorscheme(c)

    if(conf.transparent == nil) then
        if(vim.g.transparentBg == nil) then
            vim.g.transparentBg = false
        end
    else
        vim.g.transparentBg = conf.transparent
    end

    if(vim.g.transparentBg) then
        vim.opt.background = "dark"
        vim.cmd.colorscheme(vim.g.colors_name)
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end

end


return {
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 9999,
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

            Color_Me({ color = "rose-pine", transparent = false })

        end,
        keys = {
            {
                '<leader>1',
                mode = 'n',
                desc = 'colorscheme: set rose-pine',
                function()
                    Color_Me({ color = "rose-pine" })
                end,
            },
            {
                '<leader>2',
                mode = 'n',
                desc = 'colorscheme: set quiet',
                function()
                    Color_Me({ color = "quiet" })
                end,
            },
            {
                '<leader>9',
                mode = 'n',
                desc = 'colorscheme: set bg solid',
                function()
                    Color_Me({ color = vim.g.colors_name, transparent = false })
                end,
            },
            {
                '<leader>0',
                mode = 'n',
                desc = 'colorscheme: set bg transparent',
                function()
                    Color_Me({ color = vim.g.colors_name, transparent = true })
                end,
           },
        }
    }
}
