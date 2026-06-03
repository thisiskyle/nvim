local _pack_id = (debug.getinfo(1, "S").source):match("([^@/\\]+)%.lua$")


vim.pack.add({
    {
        src = 'https://github.com/rafamadriz/friendly-snippets',
        data = { pack_id = _pack_id }
    },
    {
        src = 'https://github.com/saghen/blink.lib',
        data = { pack_id = _pack_id }
    },
    {
        src = 'https://github.com/saghen/blink.cmp',
        data = { pack_id = _pack_id }
    },
}, { confirm = false })



require("blink.cmp").setup({
    enabled = function() return true end,
    fuzzy = {
        implementation = "lua"
    },
    sources = {
        default = {
            'lsp',
            'buffer',
            'snippets',
            'path',
        },
        providers = {
            lsp = {
                fallbacks = {},
                score_offset = 0,
            },
            snippets = {
                fallbacks = {},
                score_offset = 0,
            },
            path = {
                fallbacks = {},
                score_offset = 0,
                opts = {
                    get_cwd = function(_)
                        return vim.fn.getcwd()
                    end
                }
            },
            buffer = {
                fallbacks = {},
                score_offset = 0,
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
            auto_show = true,
            draw = {
                columns = {
                    { "source_name" },
                    { "kind" },
                    { "label" }
                },
            }
        },
        documentation = {
            window = {
                border = "single",
            },
            auto_show = true,
            auto_show_delay_ms = 0
        },

    },
})
