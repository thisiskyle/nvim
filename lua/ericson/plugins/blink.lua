return {
    {
        'saghen/blink.cmp',
        dependencies = {
            'rafamadriz/friendly-snippets'
        },

        opts = {
            keymap = {
                preset = 'default'
            },

            signature = {
                enabled = true,
                window = {
                    border = "single",
                },
            },

            completion = {
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false
                    }
                },
                ghost_text =  {
                    enabled = false,
                    show_with_menu = true
                },
                menu = {
                    border = "single",
                    auto_show = true
                },
                documentation = {
                    window = {
                        border = "single",
                    },
                    auto_show = true
                },

            },

            appearance = {
                nerd_font_variant = 'mono',
                kind_icons = {
                    Text = '',
                    Method = '',
                    Function = '',
                    Constructor = '',

                    Field = '',
                    Variable = '',
                    Property = '',

                    Class = '',
                    Interface = '',
                    Struct = '',
                    Module = '',

                    Unit = '',
                    Value = '',
                    Enum = '',
                    EnumMember = '',

                    Keyword = '',
                    Constant = '',

                    Snippet = '',
                    Color = '',
                    File = '',
                    Reference = '',
                    Folder = '',
                    Event = '',
                    Operator = '',
                    TypeParameter = '',
                },
            },

            sources = {
                default = {
                    'lsp',
                    'path',
                    'snippets',
                    'buffer'
                },
            },

            fuzzy = {
                implementation = "lua"
            }
        },
        opts_extend = {
            "sources.default"
        },
    }
}
