
return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        lazy = false,
        config = function()

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require('mason').setup()
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities
                        })
                    end,
                },
            })

            require("lspconfig").lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "it", "describe", "before_each", "after_each" },
                        }
                    }
                }
            })

            require("lspconfig").omnisharp.setup({
                capabilities = capabilities,
                cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp.cmd" },
                root_dir = function(fname)
                    return require('lspconfig').util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json", ".git")(fname)
                end,
            })

            -- require("lspconfig").omnisharp_mono.setup({
            --     capabilities = capabilities,
            --     root_dir = function(fname)
            --         return require('lspconfig').util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json", ".git")(fname)
            --     end,
            -- })

            vim.diagnostic.config({
                virtual_text = true,
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
            { '<leader>jd', '<cmd>lua vim.lsp.buf.definition()<cr>', mode = 'n', desc = 'lsp: jump definition' },
            { '<leader>jt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', mode = 'n', desc = 'lsp: jump type' },
            { '<leader>lf', '<cmd>lua vim.lsp.buf.hover()<cr>', mode = 'n', desc = 'lsp: open float' },
            { '<leader>df', '<cmd>lua vim.diagnostic.open_float()<cr>', mode = 'n', desc = 'diagnostic: open float' },
            { '<leader>dq', '<cmd>lua vim.diagnostic.setqflist()<cr>', mode = 'n', desc = 'diagnostic: quickfix' },
            { '<leader>dl', '<cmd>lua vim.diagnostic.setloclist()<cr>', mode = 'n', desc = 'diagnostic: local list' },
            { '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<cr>', mode = 'n', desc = 'diagnostic: go to next' },
            { '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', mode = 'n', desc = 'diagnostic: go to prev' },
            { '<leader>ds', function() vim.diagnostic.config({ virtual_text = true }) end, mode = 'n', desc = 'diagnostic: turn on virtual text' },
            { '<leader>dh', function() vim.diagnostic.config({ virtual_text = false }) end, mode = 'n', desc = 'diagnostic: turn off virtual text' },
        }
    }
}
