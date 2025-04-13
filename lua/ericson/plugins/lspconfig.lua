return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        lazy = false,
        priority = 51,
        config = function()

            local blink_capabilities = require('blink.cmp').get_lsp_capabilities()

            require('mason').setup()

            require('mason-lspconfig').setup({
                handlers = {
                    -- default handler
                    function(server_name)
                        vim.lsp.config(server_name, {
                            capabilities = blink_capabilities,
                        })
                        vim.lsp.enable(server_name)
                    end,
                },
            })


            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = {
                                    "vim",
                                    "it",
                                    "describe",
                                    "before_each",
                                    "after_each"
                                },
                            }
                        }
                    }
                },

                omnisharp = {
                    cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp.cmd" },
                    filetypes = {
                        "cs"
                    },
                    root_markers = {
                        "*.sln",
                        "*.csproj",
                        "omnisharp.json",
                        "function.json",
                        ".git"
                    }
                },
            }

            for k,v in pairs(servers) do
                if(servers[k].capabilities == nil) then
                    servers[k].capabilities = blink_capabilities
                end
                vim.lsp.config(k, v)
                vim.lsp.enable(k)
            end

        end
    }
}
