return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {

        notifier = {
            enabled = true,
            timeout = 3000,
            width = { min = 40, max = 0.4 },
            height = { min = 1, max = 0.6 },
            margin = { top = 0, right = 1, bottom = 0 },
            padding = true,
            sort = { "level", "added" },
            level = vim.log.levels.TRACE,
            icons = {
                error = "[Error] ",
                warn = "[Warn] ",
                info = "[Info] ",
                debug = "[Debug] ",
                trace = "[Trace] ",
            },
            keep = function()
                return vim.fn.getcmdpos() > 0
            end,
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
                    {
                        box = "vertical",
                        border = "single",
                        title = "{title} {live} {flags}",
                        { win = "input", height = 1, border = "bottom" },
                        { win = "list", border = "none" },
                    },
                    { win = "preview", title = "{preview}", border = "single", width = 0.5 },
                }
            },
            icons = {
                files = {
                    enabled = false,
                },
                keymaps = {
                    nowait = ""
                },
                indent = {
                    vertical = "",
                    middle   = "",
                    last     = "",
                },
                undo = {
                    saved   = "",
                },
                ui = {
                    live        = "",
                    hidden      = "",
                    ignored     = "",
                    follow      = "",
                    selected    = "+",
                    unselected  = "  ",
                },
                git = {
                    commit = "",
                },
                diagnostics = {
                    Error = "",
                    Warn  = "",
                    Hint  = "",
                    Info  = "",
                },
                kinds = {
                    Array         = "",
                    Boolean       = "",
                    Class         = "",
                    Color         = "",
                    Control       = "",
                    Collapsed     = "",
                    Constant      = "",
                    Constructor   = "",
                    Copilot       = "",
                    Enum          = "",
                    EnumMember    = "",
                    Event         = "",
                    Field         = "",
                    File          = "",
                    Folder        = "",
                    Function      = "",
                    Interface     = "",
                    Key           = "",
                    Keyword       = "",
                    Method        = "",
                    Module        = "",
                    Namespace     = "",
                    Null          = "",
                    Number        = "",
                    Object        = "",
                    Operator      = "",
                    Package       = "",
                    Property      = "",
                    Reference     = "",
                    Snippet       = "",
                    String        = "",
                    Struct        = "",
                    Text          = "",
                    TypeParameter = "",
                    Unit          = "",
                    Unknown        = "",
                    Value         = "",
                    Variable      = "",
                },
            },
        },
    },
    keys = {
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
