return {
    {
        dir = "~/AppData/Local/nvim/pack/my_pack/opt/vibe-check-nvim",
        config = function()
            require('vibe-check-nvim').setup({
                default = "rose_ghost",
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
            {'<leader>2', "<cmd>lua require('vibe-check-nvim').set_the_mood('rose_ghost')<cr>", mode = 'n'},
        }
    },
}
