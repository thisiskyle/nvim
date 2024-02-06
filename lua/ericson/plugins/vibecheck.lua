return {
    {
        dir = "~/AppData/Local/nvim/pack/my_pack/opt/vibe-check-nvim",
        config = function()
            require('vibe-check-nvim').setup({
                drab = {
                    colorscheme = 'drab-day',
                    background = 'light',
                    transparent = false,
                },

                drab_night = {
                    colorscheme = 'drab-night',
                    background = 'dark',
                    transparent = false,
                },

                drab_ghost = {
                    colorscheme = 'drab-night',
                    background = 'dark',
                    transparent = true,
                },

                cat = {
                    colorscheme = 'catppuccin',
                    background = 'dark',
                    transparent = false,
                    config = function()
                        require("catppuccin").setup({
                            flavour = "frappe",
                            transparent_background = false,
                            show_end_of_buffer = true,
                            styles = {
                                comments = { "italic" },
                                conditionals = {},
                            },
                            integrations = {
                                cmp = true,
                                gitsigns = true,
                                nvimtree = true,
                                treesitter = true,
                            },
                        })
                    end,
                    post = function()
                        vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                    end
                },

                cat_light = {
                    colorscheme = 'catppuccin',
                    background = 'light',
                    transparent = false,
                    config = function()
                        require("catppuccin").setup({
                            flavour = "latte",
                            transparent_background = false,
                            show_end_of_buffer = true,
                            styles = {
                                comments = { "italic" },
                                conditionals = {},
                            },
                            integrations = {
                                cmp = true,
                                gitsigns = true,
                                nvimtree = true,
                                treesitter = true,
                            },
                        })
                    end,
                    post = function()
                        vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                    end
                },

                cat_ghost = {
                    colorscheme = 'catppuccin',
                    background = 'dark',
                    transparent = false,
                    config = function()
                        require("catppuccin").setup({
                            flavour = "frappe",
                            transparent_background = true,
                            show_end_of_buffer = true,
                            styles = {
                                comments = { "italic" },
                                conditionals = {},
                            },
                            integrations = {
                                cmp = true,
                                gitsigns = true,
                                nvimtree = true,
                                treesitter = true,
                            },
                        })
                    end,
                    post = function()
                        vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                    end
                },
                rose_light = {
                    colorscheme = 'rose-pine',
                    background = 'light',
                    transparent = false,
                    config = function()
                        require("rose-pine").setup({
                            variant = 'dawn',
                            styles = {
                                bold = false,
                                italic = false,
                                transparency = false
                            }
                        })
                    end
                },
                rose = {
                    colorscheme = 'rose-pine',
                    background = 'dark',
                    transparent = false,
                    config = function()
                        require("rose-pine").setup({
                            variant = 'moon',
                            styles = {
                                bold = false,
                                italic = false,
                                transparency = false
                            }
                        })
                    end
                },
                rose_ghost = {
                    colorscheme = 'rose-pine',
                    background = 'dark',
                    transparent = true,
                    config = function()
                        require("rose-pine").setup({
                            variant = 'moon',
                            styles = {
                                bold = false,
                                italic = false,
                                transparency = true
                            }
                        })
                    end
                },
            })
            require('vibe-check-nvim').set_the_mood("rose")
        end
    },
}
