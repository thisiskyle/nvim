local _pack_id = (debug.getinfo(1, "S").source):match("([^@/\\]+)%.lua$")

vim.pack.add({
    {
        src = "https://github.com/folke/snacks.nvim",
        data = { pack_id = _pack_id }
    }
}, { confirm = false })


require("snacks").setup({
    notifier = {
        markdown = false,
        enabled = true,
        timeout = 3000,
        width = { min = 40, max = 0.4 },
        height = { min = 1, max = 0.6 },
        margin = { top = 0, right = 1, bottom = 0 },
        padding = true,
        sort = { "level", "added" },
        level = vim.log.levels.TRACE,
        icons = {
            error = "[E] ",
            warn = "[W] ",
            info = "[I] ",
            debug = "[D] ",
            trace = "[T] ",
        },
        style = "compact",
        top_down = true,
        date_format = "%R",
        more_format = " ↓ %d lines ",
        refresh = 50,
    },
    picker = {
        enabled = true,
        prompt = "> ",
        sources = {
            files = {
                hidden = true
            }
        },
        layout = {
            layout = {
                box = "horizontal",
                width = 0.8,
                min_width = 120,
                height = 0.8,
                [1] = {
                    box = "vertical",
                    border = "single",
                    title = "{title} {live} {flags}",
                    [1] = { win = "input", height = 1, border = "bottom" },
                    [2] = { win = "list", border = "none" },
                },
                [2] = {
                    win = "preview",
                    title = "{preview}",
                    border = "single",
                    width = 0.5
                },
            }
        },
        icons = {
            files = {
                enabled = false,
            },
            undo = {
                saved = "S ",
            },
            git = {
                enabled = false,
            },
            ui = {
                live        = "L ",
                hidden      = "h",
                ignored     = "i",
                follow      = "f",
                selected    = "+ ",
                unselected  = "  ",
            },
            diagnostics = {
                Error = "E ",
                Warn = "W ",
                Hint = "H ",
                Info = "I ",
            },
            kinds = {
                Array = "Array ",
                Boolean = "Boolean ",
                Class = "Class ",
                Color = "Color ",
                Control = "Control ",
                Collapsed = "Collapsed ",
                Constant = "Constant ",
                Constructor = "Constructor ",
                Copilot = "Copilot ",
                Enum = "Enum ",
                EnumMember = "EnumMember ",
                Event = "Event ",
                Field = "Field ",
                File = "File ",
                Folder = "Folder ",
                Function = "Function ",
                Interface = "Interface ",
                Key = "Key ",
                Keyword = "Keyword ",
                Method = "Method ",
                Module = "Module ",
                Namespace = "Namespace ",
                Null = "Null ",
                Number = "Number ",
                Object = "Object ",
                Operator = "Operator ",
                Package = "Package ",
                Property = "Property ",
                Reference = "Reference ",
                Snippet = "Snippet ",
                String = "String ",
                Struct = "Struct ",
                Text = "Text ",
                TypeParameter = "TypeParameter ",
                Unit = "Unit ",
                Unknown = "Unknown ",
                Value = "Value ",
                Variable = "Variable ",
            },
        },
    }
})

-- notifier
vim.keymap.set({ 'n' }, '<leader>nh', function() Snacks.notifier.show_history() end, { desc = 'notifier: show history' })
-- find
vim.keymap.set({ 'n' }, '<leader>pf', function() Snacks.picker.files() end, { desc = 'picker: files' })
vim.keymap.set({ 'n' }, '<leader>pk', function() Snacks.picker.keymaps() end, { desc = 'picker: keymaps' })
vim.keymap.set({ 'n' }, '<leader>pG', function() Snacks.picker.grep() end, { desc = 'picker: grep' })
vim.keymap.set({ 'n' }, '<leader>pg', function() Snacks.picker.grep_word() end, { desc = 'picker: word under cursor' })
vim.keymap.set({ 'n' }, '<leader>ph', function() Snacks.picker.help() end, { desc = 'picker: help' })
vim.keymap.set({ 'n' }, '<leader>pu', function() Snacks.picker.undo({
    diff = {
        ctxlen = 9999
    },
}) end, { desc = 'picker: undo' })

