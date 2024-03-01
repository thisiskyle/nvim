return {
    {
        dir = "~/AppData/Local/nvim/pack/my_pack/opt/vibe-check-nvim",
        config = function()
            require('vibe-check-nvim').setup({
                default = "rose_ghost",
                use_last = true,
                vibes = {
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
                        end,
                        post = function()
                            vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
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
        end
    },
}
