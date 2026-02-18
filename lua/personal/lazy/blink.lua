return {
    {
        'saghen/blink.cmp',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        enabled = true,
        lazy = false,
        priority = 51,
        opts = {

            fuzzy = {
                implementation = "lua"
            },

            sources = {
                default = {
                    'lsp',
                    'snippets',
                    'path',
                    'buffer',
                },
                providers = {
                    lsp = {
                        fallbacks = {}
                    },
                    snippets = {
                        fallbacks = {}
                    },
                    path = {
                        fallbacks = {},
                        opts = {
                            get_cwd = function(_)
                                return vim.fn.getcwd()
                            end
                        }
                    },
                    buffer = {
                        fallbacks = {},
                        opts = {
                            get_bufnrs = function(_)
                                return vim.api.nvim_list_bufs()
                            end
                        }
                    }
                }
            },

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
                    enabled = true,
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
                    EnumMember = 'enum_member',
                    Keyword = 'keyword',
                    Constant = 'constant',
                    Snippet = 'snippet',
                    Color = 'color',
                    File = 'file',
                    Reference = 'reference',
                    Folder = 'folder',
                    Event = 'event',
                    Operator = 'operator',
                    TypeParameter = 'type_parameter',
                },
            },
        },
    }
}
