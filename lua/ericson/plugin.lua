

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
require("lazy").setup({
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'debugloop/telescope-undo.nvim'
        },
        config = function()

            -- this function is for opening multiple files at once
            local select_one_or_multi = function(prompt_bufnr)
                local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
                local multi = picker:get_multi_selection()
                if not vim.tbl_isempty(multi) then
                    require('telescope.actions').close(prompt_bufnr)
                    for _, j in pairs(multi) do
                        if j.path ~= nil then
                            vim.cmd(string.format("%s %s", "edit", j.path))
                        end
                    end
                else
                    require('telescope.actions').select_default(prompt_bufnr)
                end
            end

            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<CR>"] = select_one_or_multi,
                        }
                    }
                },
                extensions = {
                    undo = {
                        mappings = {
                            i = {
                                ["<cr>"] = require("telescope-undo.actions").restore,
                                ["<C-ya>"] = require("telescope-undo.actions").yank_additions,
                                ["<C-yd>"] = require("telescope-undo.actions").yank_deletions
                            }
                        }
                    }
                }
            }
            require('telescope').load_extension('undo');
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require('nvim-treesitter.install').compilers = { "zig", "clang", "gcc" }

            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "vimdoc", "javascript", "typescript", "c",
                    "lua", "sql", "html", "c_sharp",
                    "scss", "css", "bash", "json",
                    "markdown", "markdown_inline", "yaml"
                },

                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
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
                virtual_text = true,
                signs = false

            })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()

        -- just saving these here. it was a pain to find the right size
        --    ▁▂▃▄▅▆▇█
            require('lualine').setup({
                options = {
                    icons_enabled = false,
                    theme = 'auto',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = {{'mode'}},
                    lualine_b = {{'branch'}},
                    lualine_c = {{'filename'}},
                    lualine_x = {{'diff'}},
                    lualine_y = {{'diagnostics'}},
                    lualine_z = {{'location'}}
                },
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
                    markdown = true,
                    cmp = true,
                    which_key = true,
                },
            })
        end
    },
    {
        "rose-pine/neovim",
        config = function()
            require("rose-pine").setup({
                disable_italics = true
            })
        end
    },
    { "eandrju/cellular-automaton.nvim" },
},
{
    performance = { reset_packpath = false }
})

vim.cmd.packadd("drab")
