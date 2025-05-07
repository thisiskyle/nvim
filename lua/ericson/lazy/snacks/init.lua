return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        notifier = require("ericson.lazy.snacks.notifier"),
        picker = require("ericson.lazy.snacks.picker"),
        zen = require("ericson.lazy.snacks.zen"),
        dim = { enabled = true },
        scopes = { enabled = true },
    },
    keys = {
        {
            '<leader>z',
            function()
                Snacks.zen()
            end,
            mode = 'n',
            desc = 'zen: toggle'
        },
        {
            '<leader>nh',
            function() Snacks.notifier.show_history() end,
            mode = 'n',
            desc = 'notification: show history'
        },
        {
            '<leader>ff',
            function() Snacks.picker.files() end,
            mode = 'n',
            desc = 'picker: files'
        },
        {
            '<leader>fk',
            function() Snacks.picker.keymaps() end,
            mode = 'n',
            desc = 'picker: keymaps'
        },
        {
            '<leader>fg',
            function() Snacks.picker.grep() end,
            mode = 'n',
            desc = 'picker: grep'
        },
        {
            '<leader>fw',
            function() Snacks.picker.grep_word() end,
            mode = 'n',
            desc = 'picker: word under cursor'
        },
        {
            '<leader>fh',
            function() Snacks.picker.help() end,
            mode = 'n',
            desc = 'picker: help'
        },
        {
            '<leader>fd',
            function() Snacks.picker.lsp_definitions() end,
            mode = 'n',
            desc = 'picker: lsp definitions'
        },
        {
            '<leader>fr',
            function() Snacks.picker.lsp_references() end,
            mode = 'n',
            desc = 'picker: lsp references'
        },
        {
            '<leader>fi',
            function() Snacks.picker.lsp_implementations() end,
            mode = 'n',
            desc = 'picker: lsp implementations'
        },
        {
            '<leader>fs',
            function() Snacks.picker.lsp_symbols() end,
            mode = 'n',
            desc = 'picker: lsp symbols'
        },
    }
}
