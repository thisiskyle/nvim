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
    end
end


return {
    {
        "rose-pine/neovim",
        lazy = false,
        config = function()
            require("rose-pine").setup({
                variant = "moon",
                enable = {
                    terminal = true
                },
                styles = {
                    bold = false,
                    italic = false,
                    transparency = false,
                },
                highlight_groups = {
                    Comment = { italic = true }
                }
            })
            ColorMe()
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
        }
    },
}
