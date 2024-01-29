return {
    {
        dir = "~/AppData/Local/nvim/pack/my_pack/opt/vibe-check-nvim",
        config = function()
            require('vibe-check-nvim').setup({
                cat = {
                    colorscheme = 'catppuccin-frappe',
                    background = 'dark',
                    transparent = false,
                    post = function()
                        vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                    end
                },
                cat_light = {
                    colorscheme = 'catppuccin-latte',
                    background = 'light',
                    transparent = false,
                    post = function()
                        vim.api.nvim_set_hl(0, 'Todo', { link = 'Comment' })
                    end
                },
                cat_ghost = {
                    colorscheme = 'catppuccin-frappe',
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
                drab_night = {
                    colorscheme = 'drab-night',
                    background = 'dark',
                    transparent = false,
                },
                drab_ghost = {
                    colorscheme = 'drab-night',
                    background = 'dark',
                    transparent = true,
                }
            })
            require('vibe-check-nvim').set_the_mood("cat")
        end
    },
}
