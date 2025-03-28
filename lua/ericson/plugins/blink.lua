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
                    Text = 'text',
                    Method = 'method',
                    Function = 'function',
                    Constructor = 'constructor',

                    Field = 'field',
                    Variable = 'variable',
                    Property = 'property',

                    Class = 'class',
                    Interface = 'interface',
                    Struct = 'struct',
                    Module = 'module',

                    Unit = 'unit',
                    Value = 'value',
                    Enum = 'enum',
                    EnumMember = 'enumMember',

                    Keyword = 'keyword',
                    Constant = 'constant',

                    Snippet = 'snippet',
                    Color = 'color',
                    File = 'file',
                    Reference = 'reference',
                    Folder = 'folder',
                    Event = 'event',
                    Operator = 'operator',
                    TypeParameter = 'typeParameter',
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
