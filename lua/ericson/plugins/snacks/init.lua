return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        notifier = require("ericson.plugins.snacks.notifier"),
        picker = require("ericson.plugins.snacks.picker"),
        -- zen = require("ericson.plugins.snacks.zen"),
        -- dim = { enabled = true },
        -- scopes = { enabled = true },
    },
    keys = {
        {
            '<leader>z',
            function()
                Snacks.zen()
            end,
            mode = 'n'
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
            desc = 'find: files'
        },
        {
            '<leader>fk',
            function() Snacks.picker.keymaps() end,
            mode = 'n',
            desc = 'find: keymaps'
        },
        {
            '<leader>fg',
            function() Snacks.picker.grep() end,
            mode = 'n',
            desc = 'find: grep'
        },
        {
            '<leader>fw',
            function() Snacks.picker.grep_word() end,
            mode = 'n',
            desc = 'find: word under cursor'
        },
        {
            '<leader>fh',
            function() Snacks.picker.help() end,
            mode = 'n',
            desc = 'find: help'
        },
        {
            '<leader>fd',
            function() Snacks.picker.lsp_definitions() end,
            mode = 'n',
            desc = 'find: lsp definitions'
        },
        {
            '<leader>fr',
            function() Snacks.picker.lsp_references() end,
            mode = 'n',
            desc = 'find: lsp references'
        },
        {
            '<leader>fi',
            function() Snacks.picker.lsp_implementations() end,
            mode = 'n',
            desc = 'find: lsp implementations'
        },
        {
            '<leader>fs',
            function() Snacks.picker.lsp_symbols() end,
            mode = 'n',
            desc = 'find: lsp symbols'
        },
    }
}
