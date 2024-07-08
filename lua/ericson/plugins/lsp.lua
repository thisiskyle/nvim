return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        lazy = false,
        config = function()

            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                require('cmp_nvim_lsp').default_capabilities()
            )

            require('mason').setup()
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities
                        })
                    end,

                    ["lua_ls"] = function()
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
                    end,

                    ["omnisharp"] = function()
                        require("lspconfig").omnisharp.setup({
                            capabilities = capabilities,
                            root_dir = function(fname)
                                return require('lspconfig').util.root_pattern('.git', '.sln')(fname)
                            end,
                        })
                    end,

                    ["omnisharp_mono"] = function()
                        require("lspconfig").omnisharp_mono.setup({
                            capabilities = capabilities,
                            root_dir = function(fname)
                                return require('lspconfig').util.root_pattern('.git', '.sln')(fname)
                            end,
                        })
                    end,
                },
            })

            vim.diagnostic.config({
                signs = false,
                underline = false,
                virtual_text = {
                    prefix = "•",
                },
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end,
        keys = {
            {'<leader>jd', '<cmd>lua vim.lsp.buf.definition()<cr>', mode = 'n'},
            {'<leader>jt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', mode = 'n'},
            {'<leader>li', '<cmd>lua vim.lsp.buf.hover()<cr>', mode = 'n'},
            {'<leader>di', '<cmd>lua vim.diagnostic.open_float()<cr>', mode = 'n'},
            {'<leader>dq', '<cmd>lua vim.diagnostic.setqflist()<cr>', mode = 'n'},
            {'<leader>dl', '<cmd>lua vim.diagnostic.setloclist()<cr>', mode = 'n'},
            {'<leader>dh', '<cmd>lua vim.diagnostic.hide()<cr>', mode = 'n'},
            {'<leader>ds', '<cmd>lua vim.diagnostic.show()<cr>', mode = 'n'},
            {'<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<cr>', mode = 'n'},
            {'<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', mode = 'n'},
        }
    }
}
