return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        zen = require("ericson.plugins.snacks.zen"),
        notifier = require("ericson.plugins.snacks.notifier"),
        picker = require("ericson.plugins.snacks.picker"),
        dim = { enabled = true },
        scopes = { enabled = true },
        git = { enabled = true }
    },
    keys = {
        { '<leader>z', function() Snacks.zen() end, mode = 'n'},
        { '<leader>nh', function() Snacks.notifier.show_history() end, mode = 'n'},
        { '<leader>ff', function() Snacks.picker.files() end, mode = 'n'},
        { '<leader>fg', function() Snacks.picker.grep() end, mode = 'n'},
        { '<leader>fw', function() Snacks.picker.grep_word() end, mode = 'n'},
        { '<leader>fh', function() Snacks.picker.help() end, mode = 'n'},
        { '<leader>fd', function() Snacks.picker.lsp_definitions() end, mode = 'n'},
        { '<leader>fr', function() Snacks.picker.lsp_references() end, mode = 'n'},
        { '<leader>fi', function() Snacks.picker.lsp_implementations() end, mode = 'n'},
        { '<leader>fs', function() Snacks.picker.lsp_symbols() end, mode = 'n'},
    }
}
