
function ColorMe(conf)
    local c = "rose-pine"
    local bg = "transparent"

    if(vim.g.transparent ~= nil and not vim.g.transparent) then
        bg = "dark"
    end

    if(conf) then
        c = conf.color or c
        bg = conf.bg or bg
    end

    vim.cmd.colorscheme(c)

    if(bg == "transparent") then
        TransparentBg()
    else
        vim.opt.background = bg
        SolidBg()
    end

end

function TransparentBg()
    vim.opt.background = "dark"
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.g.transparent = true
end

function SolidBg()
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.g.transparent = false
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

            ColorMe()
        end,
        keys = {
            {
                '<leader>1',
                mode = 'n',
                desc = 'color: set default colorscheme',
                function()
                    ColorMe()
                end,
            },
            {
                '<leader>2',
                mode = 'n',
                desc = 'color: set quiet',
                function()
                    ColorMe({ color = "quiet", bg = "light" })
                end,
            },
            {
                '<leader>9',
                mode = 'n',
                desc = 'color: set background transparent',
                function()
                    TransparentBg()
                end,
            },
            {
                '<leader>0',
                mode = 'n',
                desc = 'color: set background solid',
                function()
                    SolidBg()
                end,
            },
        }
    },
}
