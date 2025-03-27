return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'saadparwaiz1/cmp_luasnip'},
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        },
        enabled = false,
        lazy = false,
        config = function()

            require("luasnip.loaders.from_vscode").lazy_load()

            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    {
                        name = 'buffer',
                        option = {
                            get_bufnrs = function()
                                return vim.api.nvim_list_bufs()
                            end
                        }
                    },
                    { name = 'path' },
                },

                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
            })
        end
    }
}
