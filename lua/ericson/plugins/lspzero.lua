return {
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        },
        config = function()

            require('mason').setup()

            local lsp = require("lsp-zero")
            local cmp = require('cmp')

            lsp.preset("recommended")
            lsp.ensure_installed({})

            -- Fix Undefined global 'vim'
            lsp.nvim_workspace()

            lsp.set_preferences({
                suggest_lsp_servers = false,
                sign_icons = { error = 'E', warn = 'W', hint = 'H', info = 'I' }
            })

            lsp.setup_nvim_cmp({
                mapping = lsp.defaults.cmp_mappings({
                    ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
                    ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                })
            })

            lsp.setup()
            vim.diagnostic.config({
                virtual_text = { spacing = 20 },
                signs = false,
                underline = false
            })
        end
    }
}
