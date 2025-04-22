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
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        vim.lsp.enable(server_name)
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
                mode = 'n',
                desc = 'lsp: go to definition',
                function()
                    vim.lsp.buf.definition()
                end,
            },
            {
                '<leader>lt',
                mode = 'n',
                desc = 'lsp: go to type definition',
                function()
                    vim.lsp.buf.type_definition()
                end,
            },
            {
                '<leader>lf',
                function()
                    vim.lsp.buf.hover()
                end,
                mode = 'n',
                desc = 'lsp: open float',
            },
        }
    }
}
