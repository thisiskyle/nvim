return {
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


}
