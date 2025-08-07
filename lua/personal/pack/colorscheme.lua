local function transparent_bg()
    vim.opt.background = "dark"
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

local function solid_bg()
    vim.cmd.colorscheme(vim.g.colors_name)
end


return {
    sources = {
        {
            src = "http://github.com/rose-pine/neovim",
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

        vim.cmd.colorscheme("rose-pine")

        vim.keymap.set(
            { 'n' },
            '<leader>9',
            function()
                solid_bg()
            end,
            { desc = 'colorscheme: set bg solid' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>0',
            function()
                transparent_bg()
            end,
            { desc = 'colorscheme: set bg tranparent' }
        )

    end
}
