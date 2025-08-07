return {
    enabled = true,
    sources = {
        "http://github.com/folke/snacks.nvim",
    },
    setup = function()
        require("snacks").setup({
            notifier = require("personal.pack.snacks.notifier"),
            picker = require("personal.pack.snacks.picker"),
            zen = require("personal.pack.snacks.zen"),
            dim = { enabled = true },
            scopes = { enabled = true },

        })

        vim.keymap.set(
            { 'n' },
            '<leader>z',
            function() Snacks.zen() end,
            { desc = 'zen: toggle' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>nh',
            function() Snacks.notifier.show_history() end,
            { desc = 'notification: show history' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>ff',
            function() Snacks.picker.files() end,
            { desc = 'picker: files' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>fk',
            function() Snacks.picker.keymaps() end,
            { desc = 'picker: keymaps' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>fg',
            function() Snacks.picker.grep() end,
            { desc = 'picker: grep' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>fw',
            function() Snacks.picker.grep_word() end,
            { desc = 'picker: word under cursor' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>fh',
            function() Snacks.picker.help() end,
            { desc = 'picker: help' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>fd',
            function() Snacks.picker.lsp_definitions() end,
            { desc = 'picker: lsp definitions' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>fr',
            function() Snacks.picker.lsp_references() end,
            { desc = 'picker: lsp references' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>fi',
            function() Snacks.picker.lsp_implementations() end,
            { desc = 'picker: lsp implementations' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>fs',
            function() Snacks.picker.lsp_symbols() end,
            { desc = 'picker: lsp symbols' }
        )

    end
}
