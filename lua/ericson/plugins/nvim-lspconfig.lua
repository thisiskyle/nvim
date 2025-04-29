
local lsp_override = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        "vim",
                        "it",
                        "describe",
                        "before_each",
                        "Snacks",
                        "after_each"
                    },
                }
            }
        }
    }
}

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        lazy = false,
        priority = 50,
        config = function()


            require('mason').setup()

            -- use mason-lspconfig so we can automate lsp enabling
            -- this allows us to install with Mason and enable without adding
            -- a vim.lsp.enable() to our config
            require('mason-lspconfig').setup({
                handlers = {
                    function(lsp)
                        if(lsp_override[lsp]) then
                            -- override/merge custom config with nvim-lspconfig
                            vim.lsp.config(lsp, lsp_override[lsp])
                        end
                        vim.lsp.enable(lsp)
                    end,
                },
            })


            vim.diagnostic.config({
                virtual_text = true,
                virtual_lines = false,
                signs = false,
                underline = false,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "single",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

        end,
        keys = {
            {
                '<leader>ld',
                mode = { 'n' },
                desc = 'lsp: go to definition',
                function()
                    vim.lsp.buf.definition()
                end,
            },

            {
                '<leader>lt',
                mode = { 'n' },
                desc = 'lsp: go to type definition',
                function()
                    vim.lsp.buf.type_definition()
                end,
            },

            {
                '<leader>lf',
                mode = { 'n' },
                desc = 'lsp: open float',
                function()
                    vim.lsp.buf.hover()
                end,
            },

            {
                '<leader>df',
                mode = { 'n' },
                desc = 'diagnostic: open float',
                function()
                    vim.diagnostic.open_float()
                end,
            },

            {
                '<leader>dq',
                mode = { 'n' },
                desc = 'diagnostic: quickfix',
                function()
                    vim.diagnostic.setqflist()
                end,
            },

            {
                '<leader>dl',
                mode = { 'n' },
                desc = 'diagnostic: local list',
                function()
                    vim.diagnostic.setloclist()
                end,
            },

            {
                '<leader>dn',
                mode = { 'n' },
                desc = 'diagnostic: go to next',
                function()
                    vim.diagnostic.goto_next()
                end,
            },

            {
                '<leader>dp',
                mode = { 'n' },
                desc = 'diagnostic: go to prev',
                function()
                    vim.diagnostic.goto_prev()
                end,
            },

            {
                '<leader>ds',
                mode = { 'n' },
                desc = 'diagnostic: turn on virtual text',
                function()
                    vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
                end,
            },

            {
                '<leader>dh',
                mode = { 'n' },
                desc = 'diagnostic: turn off virtual text',
                function()
                    vim.diagnostic.config({ virtual_text = false, virtual_lines = false })
                end,
            }

        }
    }
}
