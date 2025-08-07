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
                    'path',
                    'snippets',
                    'buffer',
                },
                providers = {
                    path = {
                        opts = {
                            get_cwd = function(_)
                                return vim.fn.getcwd()
                            end
                        }
                    },
                    buffer = {
                        opts = {
                            get_bufnrs = function()
                                local allOpenBuffers = vim.fn.getbufinfo { buflisted = 1, bufloaded = 1 }
                                local allBufs = vim.iter(allOpenBuffers)
                                    :filter(function(buf) return vim.bo[buf.bufnr].buftype == "" end)
                                    :map(function(buf) return buf.bufnr end)
                                    :totable()
                                return allBufs
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
