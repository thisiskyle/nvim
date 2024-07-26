return {
    {
        dir = vim.fn.stdpath("config") .. "/pack/my_pack/opt/vibe-check-nvim",
        lazy = false,
        config = function()
            require('vibe-check-nvim').setup({
                default = "cyberdream_dark",
                startup = "previous",
                vibes = {

                    rose = {
                        colorscheme = 'rose-pine',
                        background = 'dark',
                        config = function()
                            require("rose-pine").setup({
                                variant = 'moon',
                                styles = {
                                    bold = false,
                                    italic = false,
                                    transparency = false,
                                },
                                highlight_groups = {
                                    Comment = { fg = "subtle", italic = true },
                                    Todo = { link = "Comment"}
                                }
                            })
                        end,
                    },

                    rose_dawn = {
                        colorscheme = 'rose-pine',
                        background = 'light',
                        config = function()
                            require("rose-pine").setup({
                                variant = 'dawn',
                                styles = {
                                    bold = false,
                                    italic = false,
                                    transparency = false
                                },
                                highlight_groups = {
                                    Comment = { fg = "subtle", italic = true },
                                    Todo = { link = "Comment"}
                                }
                            })
                        end,
                    },

                    rose_clear = {
                        colorscheme = 'rose-pine',
                        background = 'dark',
                        config = function()
                            require("rose-pine").setup({
                                variant = 'moon',
                                styles = {
                                    bold = false,
                                    italic = false,
                                    transparency = true
                                },
                                highlight_groups = {
                                    Comment = { fg = "subtle", italic = true },
                                    Todo = { link = "Comment"}
                                }
                            })
                        end,
                    },

                    cyberdream_light = {
                        colorscheme = 'cyberdream',
                        background = 'light',
                        config = function()
                            require("cyberdream").setup({
                                transparent = false,
                                italic_comments = true,
                                hide_fillchars = false,
                                borderless_telescope = true,
                                terminal_colors = true,
                                theme = {
                                    variant = "auto",
                                },

                                extensions = {
                                    telescope = true,
                                    cmp = true,
                                },
                            })
                        end,
                        after = function()
                            vim.opt.fillchars = "eob:~"
                            vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                            vim.api.nvim_set_hl(0, 'EndOfBuffer', { link = 'Comment' })
                        end
                    },

                    cyberdream_dark = {
                        colorscheme = 'cyberdream',
                        background = 'dark',
                        config = function()
                            require("cyberdream").setup({
                                transparent = false,
                                italic_comments = true,
                                hide_fillchars = false,
                                borderless_telescope = true,
                                terminal_colors = true,
                                theme = {
                                    variant = "auto",
                                },

                                extensions = {
                                    telescope = true,
                                    cmp = true,
                                },
                            })
                        end,
                        after = function()
                            vim.opt.fillchars = "eob:~"
                            vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                            vim.api.nvim_set_hl(0, 'EndOfBuffer', { link = 'Comment' })
                        end
                    },

                    cyberdream_clear = {
                        colorscheme = 'cyberdream',
                        background = 'dark',
                        config = function()
                            require("cyberdream").setup({
                                transparent = true,
                                italic_comments = true,
                                hide_fillchars = false,
                                borderless_telescope = true,
                                terminal_colors = true,
                                theme = {
                                    variant = "auto",
                                },

                                extensions = {
                                    telescope = true,
                                    cmp = true,
                                },
                            })
                        end,
                        after = function()
                            vim.opt.fillchars = "eob:~"
                            vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                            vim.api.nvim_set_hl(0, 'EndOfBuffer', { link = 'Comment' })
                        end
                    },
                }
            })
        end,
        keys = {
            {'<leader>1', "<cmd>lua require('vibe-check-nvim').set_the_mood('rose')<cr>", mode = 'n'},
            {'<leader>2', "<cmd>lua require('vibe-check-nvim').set_the_mood('rose_clear')<cr>", mode = 'n'},
            {'<leader>3', "<cmd>lua require('vibe-check-nvim').set_the_mood('rose_dawn')<cr>", mode = 'n'},
            {'<leader>4', "<cmd>lua require('vibe-check-nvim').set_the_mood('cyberdream_dark')<cr>", mode = 'n'},
            {'<leader>5', "<cmd>lua require('vibe-check-nvim').set_the_mood('cyberdream_clear')<cr>", mode = 'n'},
            {'<leader>6', "<cmd>lua require('vibe-check-nvim').set_the_mood('cyberdream_light')<cr>", mode = 'n'},
        }
    },
}
