return {
    {
        'sphamba/smear-cursor.nvim',
        lazy = false,
        opts = {
            legacy_computing_symbols_support = false
        },
        keys = {
            { '<leader>tm', "<cmd>SmearCursorToggle<cr>", mode = 'n'},
        }
    }
}
