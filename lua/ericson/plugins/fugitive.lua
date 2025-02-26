return {
    {
        "tpope/vim-fugitive",
        lazy = true,
        keys = {
            { '<leader>gg', '<cmd>G<cr>', mode = 'n', desc = "fugitive: open" },
            { '<leader>gl', '<cmd>G adog<cr>', mode = 'n', desc = "fugitive: git adog" },
            { '<leader>gs', '<cmd>G status<cr>', mode = 'n', desc = "fugitive: git status" },
        }

    }
}
