return {
    {
        'sphamba/smear-cursor.nvim',
        lazy = false,
        opts = {
            legacy_computing_symbols_support = true
        },
        keys = {
            { '<leader>tm', "<cmd>SmearCursorToggle<cr>", mode = 'n'},
        }
    }
}
