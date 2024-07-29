return {
    {
        dir = vim.fn.stdpath("config") .. "/pack/my_pack/opt/vibe-check-nvim",
        lazy = false,
        config = function()
            require('vibe-check-nvim').setup({
                default = "tokyonight",
                startup = "previous",
                vibes = {

                    tokyonight = {
                        colorscheme = 'tokyonight',
                        background = 'dark',
                        config = function()
                            require("tokyonight").setup({
                                style = "storm",
                                transparent = false,
                                terminal_colors = true,
                                styles = {
                                    comments = { italic = true },
                                    keywords = { italic = false },
                                    functions = { italic = false },
                                    variables = { italic = false },
                                    sidebars = "dark",
                                    floats = "dark",
                                },
                                on_highlights = function(hl, c)
                                    hl.EndOfBuffer = { link = "Comment" }
                                end,
                            })
                        end,
                        after = function()
                            vim.opt.fillchars = "eob:~"
                        end
                    },

                    tokyonight_light = {
                        colorscheme = 'tokyonight',
                        background = 'light',
                        config = function()
                            require("tokyonight").setup({
                                style = "day",
                                transparent = false,
                                terminal_colors = true,
                                styles = {
                                    comments = { italic = true },
                                    keywords = { italic = false },
                                    functions = { italic = false },
                                    variables = { italic = false },
                                    sidebars = "light",
                                    floats = "light",
                                },
                                on_highlights = function(hl, c)
                                    hl.EndOfBuffer = { link = "Comment" }
                                end,
                                -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                                day_brightness = 0.3,
                            })
                        end,
                        after = function()
                            vim.opt.fillchars = "eob:~"
                        end
                    },

                    tokyonight_clear = {
                        colorscheme = 'tokyonight',
                        background = 'dark',
                        config = function()
                            require("tokyonight").setup({
                                style = "storm",
                                transparent = true,
                                terminal_colors = true,
                                styles = {
                                    comments = { italic = true },
                                    keywords = { italic = false },
                                    functions = { italic = false },
                                    variables = { italic = false },
                                    sidebars = "transparent",
                                    floats = "transparent",
                                },
                                on_highlights = function(hl, c)
                                    hl.EndOfBuffer = { link = "Comment" }
                                end,
                            })
                        end,
                        after = function()
                            vim.opt.fillchars = "eob:~"
                        end
                    },
                }
            })
        end,
        keys = {
            {'<leader>1', "<cmd>lua require('vibe-check-nvim').set_the_mood('tokyonight')<cr>", mode = 'n'},
            {'<leader>2', "<cmd>lua require('vibe-check-nvim').set_the_mood('tokyonight_clear')<cr>", mode = 'n'},
            {'<leader>3', "<cmd>lua require('vibe-check-nvim').set_the_mood('tokyonight_light')<cr>", mode = 'n'},
        }
    },
}
