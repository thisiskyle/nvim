

-- install lazy.nvim if its not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim/"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- add lazypath to runtime path
vim.opt.rtp:prepend(lazypath)


-- setup plugins
require("lazy").setup(
    {
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {
                'nvim-lua/plenary.nvim'
            }
        },
        {
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require('nvim-treesitter.configs').setup({
                    ensure_installed = {
                        "vimdoc", "javascript", "typescript", "c",
                        "lua", "sql", "html", "c_sharp",
                        "scss", "css", "bash", "json"
                    },

                    auto_install = false,
                })

                vim.cmd([[ TSUpdate ]])
            end
        },
        {
            "folke/which-key.nvim",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 500
            end,
            opts = {}
        },
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
                lsp.preset("recommended")
                lsp.ensure_installed({})
                -- Fix Undefined global 'vim'
                lsp.nvim_workspace()

                local cmp = require('cmp')
                local cmp_select = {behavior = cmp.SelectBehavior.Select}
                local cmp_mappings = lsp.defaults.cmp_mappings({

                  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                  ["<C-Space>"] = cmp.mapping.complete(),
                })

                cmp_mappings['<Tab>'] = nil
                cmp_mappings['<S-Tab>'] = nil

                lsp.setup_nvim_cmp({ mapping = cmp_mappings })

                lsp.set_preferences({
                    suggest_lsp_servers = false,
                    sign_icons = {
                        error = 'E',
                        warn = 'W',
                        hint = 'H',
                        info = 'I'
                    }
                })

                lsp.on_attach(function(client, bufnr)
                  local opts = {buffer = bufnr, remap = false}

                  vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
                  vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
                  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                  vim.keymap.set("n", "<leader>nd", function() vim.diagnostic.goto_next() end, opts)
                  vim.keymap.set("n", "<leader>pd", function() vim.diagnostic.goto_prev() end, opts)
                  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                end)

                lsp.setup()

                vim.diagnostic.config({
                    virtual_text = true
                })

            end
        },
        {
            "catppuccin/nvim",
            config = function()
                require("catppuccin").setup({
                    flavour = "frappe", -- latte, frappe, macchiato, mocha
                    background = { light = "latte", dark = "frappe", },
                    transparent_background = false,
                    show_end_of_buffer = true,
                    term_colors = false,
                    no_italic = true,
                    no_bold = false,
                    no_underline = false,
                    integrations = {
                        treesitter = true,
                    },
                })
            end
        },
        {
            "eandrju/cellular-automaton.nvim"
        },
        {
            "nvim-lualine/lualine.nvim",
            config = function()
                require('lualine').setup({
                    options = {
                        icons_enabled = false,
                    },
                    sections = {
                        lualine_a = {'mode'},
                        lualine_b = {'branch'},
                        lualine_c = {'filename'},
                        lualine_x = {'diagnostics', 'diff'},
                        lualine_y = {'progress'},
                        lualine_z = {'location'}
                    },
            })
            end

        }
    },
    { performance = { reset_packpath = false } }
)


vim.cmd.packadd("drab")
