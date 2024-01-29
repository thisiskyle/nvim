return {
    {
        dir = "~/AppData/Local/nvim/pack/my_pack/opt/vibe-check-nvim",
        config = function()
            require('vibe-check-nvim').setup({
                rose_light = {
                    colorscheme = 'rose-pine',
                    background = 'light',
                    transparent = false,
                    config = function()
                        require("rose-pine").setup({
                            variant = 'dawn',
                            style = {
                                bold = false,
                                italic = false,
                                transparency = false
                            }
                        })
                    end
                },
                rose_dark = {
                    colorscheme = 'rose-pine',
                    background = 'dark',
                    transparent = false,
                    config = function()
                        require("rose-pine").setup({
                            variant = 'moon',
                            style = {
                                bold = false,
                                italic = false,
                                transparency = false
                            }
                        })
                    end
                },
                rose_transparent = {
                    colorscheme = 'rose-pine',
                    background = 'dark',
                    transparent = true,
                    config = function()
                        require("rose-pine").setup({
                            variant = 'moon',
                            style = {
                                bold = false,
                                italic = false,
                                transparency = true
                            }
                        })
                    end
                },
                cat = {
                    colorscheme = 'catppuccin',
                    background = 'dark',
                    transparent = false,
                    post = function()
                        vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                    end
                },
                cat_light = {
                    colorscheme = 'catppuccin',
                    background = 'light',
                    transparent = false,
                    post = function()
                        vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                    end
                },
                cat_ghost = {
                    colorscheme = 'catppuccin',
                    background = 'dark',
                    transparent = true,
                    post = function()
                        vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                    end
                },
                drab = {
                    colorscheme = 'drab-day',
                    background = 'light',
                    transparent = false,
                },
                drab_dark = {
                    colorscheme = 'drab-night',
                    background = 'dark',
                    transparent = false,
                },
                drab_transparent = {
                    colorscheme = 'drab-night',
                    background = 'dark',
                    transparent = true,
                }
            })
            require('vibe-check-nvim').set_the_mood("cat")
        end
    },
}
