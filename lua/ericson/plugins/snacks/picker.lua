return {
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
            vertical    = "│ ",
            middle = "├╴",
            last   = "└╴",
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
}
