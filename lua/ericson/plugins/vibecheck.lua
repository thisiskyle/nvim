return {
    {
        dir = vim.fn.stdpath("config") .. "/pack/my_pack/opt/vibe-check-nvim",
        lazy = false,
        config = function()
            require('vibe-check-nvim').setup({
                default = "rose",
                use_last = true,
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
                                    transparency = false
                                }
                            })
                        end,
                        post = function()
                            vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                        end
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
                                }
                            })
                        end,
                        post = function()
                            vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                        end
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
                                }
                            })
                        end,
                        post = function()
                            vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                        end
                    },
                }
            })
        end,
        keys = {
            {'<leader>1', "<cmd>lua require('vibe-check-nvim').set_the_mood('rose')<cr>", mode = 'n'},
            {'<leader>2', "<cmd>lua require('vibe-check-nvim').set_the_mood('rose_clear')<cr>", mode = 'n'},
            {'<leader>3', "<cmd>lua require('vibe-check-nvim').set_the_mood('rose_dawn')<cr>", mode = 'n'},
        }
    },
}
