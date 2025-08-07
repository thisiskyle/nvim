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

local function color_me(conf)
    -- default
    local c = "habamax"
    local bg = "transparent"
    -- override bg with global var
    if(vim.g.transparent ~= nil and not vim.g.transparent) then
        bg = "dark"
    end
    -- override with conf
    if(conf) then
        c = conf.color or c
        bg = conf.bg or bg
    end
    -- set
    vim.cmd.colorscheme(c)
    if(bg == "transparent") then
        transparent_bg()
    else
        vim.opt.background = bg
        solid_bg()
    end
end



return {
    sources = {
        {
            src = "https://github.com/rose-pine/neovim",
            name = "rose-pine"
        }
    },
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

        color_me({ color = "rose-pine", bg = "transparent" })

        vim.keymap.set(
            { 'n' },
            '<leader>1',
            function() color_me({ color = "rose-pine" }) end,
            { desc = 'colorscheme: set rose-pine' }
        )
        vim.keymap.set(
            { 'n' },
            '<leader>2',
            function() color_me({ color = "quiet" }) end,
            { desc = 'colorscheme: set quiet' }
        )
        vim.keymap.set(
            { 'n' },
            '<leader>9',
            function() solid_bg() end,
            { desc = 'colorscheme: set bg solid' }
        )
        vim.keymap.set(
            { 'n' },
            '<leader>0',
            function() transparent_bg() end,
            { desc = 'colorscheme: set bg tranparent' }
        )

    end
}

