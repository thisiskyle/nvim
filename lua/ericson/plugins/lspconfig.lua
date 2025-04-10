return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'saghen/blink.cmp'},
        },
        lazy = false,
        config = function()

            local blink_capabilities = require('blink.cmp').get_lsp_capabilities()

            require('mason').setup()
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = blink_capabilities,
                        })
                    end,
                },
            })

            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim", "it", "describe", "before_each", "after_each" },
                            }
                        }
                    }
                },

                omnisharp = {
                    cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp.cmd" },
                    root_dir = function(fname)
                        return require('lspconfig').util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json", ".git")(fname)
                    end,
                },

                omnisharp_mono = {
                    cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp_mono.cmd" },
                    root_dir = function(fname)
                        return require('lspconfig').util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json", ".git")(fname)
                    end,
                },
            }

            for k,v in pairs(servers) do
                if(servers[k].capabilities == nil) then
                    servers[k].capabilities = blink_capabilities
                end
                require("lspconfig")[k].setup(v)
            end

        end
    }
}
