return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        zen = { enabled = true },
    },
    keys = {
        { '<leader>z', function() Snacks.zen() end, mode = 'n'},
    }
}
