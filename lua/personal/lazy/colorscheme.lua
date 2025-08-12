local function transparent_bg()
    vim.opt.background = "dark"
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.g.transparent = true
end

local function solid_bg()
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.g.transparent = false
end

function Color_Me(conf)
    local c = conf.color or "habamax"
    local t = conf.transparent or false

    vim.cmd.colorscheme(c)

    if(t) then
        transparent_bg()
    else
        solid_bg()
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

            Color_Me({ color = "rose-pine" })

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
                    solid_bg()
                end,
            },
            {
                '<leader>0',
                mode = 'n',
                desc = 'colorscheme: set bg tranparent',
                function()
                    transparent_bg()
                end,
           },
        }
    }
}
