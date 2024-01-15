
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
                    file_ignore_patterns = {
                        "node_modules",
                        ".git",
                        "Library",
                        "%.meta",
                        "%.unity",
                        "%.asset",
                        "%.anim",
                        "%.png",
                        "%.asset"
                    },
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
                                ["<C-a>"] = require("telescope-undo.actions").yank_additions,
                                ["<C-d>"] = require("telescope-undo.actions").yank_deletions,
                                ["<cr>"] = require("telescope-undo.actions").restore,
                            },
                            n = {
                                ["ya"] = require("telescope-undo.actions").yank_additions,
                                ["yd"] = require("telescope-undo.actions").yank_deletions,
                                ["<cr>"] = require("telescope-undo.actions").restore,
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
                    "scss", "python", "css", "bash", "json",
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
    },
    { "rose-pine/neovim" },
    { dir = "~/AppData/Local/nvim/pack/my_pack/opt/drab" },
    {
        dir = "~/AppData/Local/nvim/pack/my_pack/opt/vibe-check-nvim",
        config = function()
            require('vibe-check-nvim').setup({
                rose_light = {
                    colorscheme = 'rose-pine',
                    transparent = false,
                    config = function()
                        require("rose-pine").setup({
                            variant = 'dawn',
                            disable_italics = true,
                            disable_background = false,
                            disable_float_background = false
                        })
                    end
                },
                rose_dark = {
                    colorscheme = 'rose-pine',
                    transparent = false,
                    config = function()
                        require("rose-pine").setup({
                            variant = 'moon',
                            disable_italics = true,
                            disable_background = false,
                            disable_float_background = false
                        })
                    end
                },
                rose_transparent = {
                    colorscheme = 'rose-pine',
                    transparent = true,
                    config = function()
                        require("rose-pine").setup({
                            variant = 'moon',
                            disable_italics = true,
                            disable_background = true,
                            disable_float_background = true
                        })
                    end
                },
                drab = {
                    colorscheme = 'drab-day',
                    transparent = false,
                },
                drab_transparent = {
                    colorscheme = 'drab-night',
                    transparent = true,
                }
            })

            require('vibe-check-nvim').set_the_mood("rose_transparent")
        end
    },
})
