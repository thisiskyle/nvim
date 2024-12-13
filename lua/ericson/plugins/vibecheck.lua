return {
    {
        dir = vim.fn.stdpath("config") .. "/pack/my_pack/opt/vibecheck-nvim",
        lazy = false,
        config = function()
            require('vibecheck').setup({
                default = "tokyonight",
                startup = "last",
                after_any = function()
                    vim.opt.fillchars = "eob:~"
                    vim.api.nvim_set_hl(0, "EndOfBuffer", { link = "Comment" })
                end,

                vibes = {

                    quiet = {
                        colorscheme = 'quiet',
                        background = 'light',
                        after = function()
                            vim.api.nvim_set_hl(0, "Comment", { fg = "#848484", italic = true })
                        end
                    },

                    tokyonight = {
                        colorscheme = 'tokyonight',
                        background = 'dark',
                        config = function()
                            require("tokyonight").setup({
                                style = "moon",
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
                            })
                        end,
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
                                day_brightness = 0.3,
                            })
                        end,
                    },

                    tokyonight_clear = {
                        colorscheme = 'tokyonight',
                        background = 'dark',
                        config = function()
                            require("tokyonight").setup({
                                style = "moon",
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
                            })
                        end,
                    },
                    rose_pine = {
                        colorscheme = 'rose-pine',
                        background = 'dark',
                        config = function()
                            require("rose-pine").setup({
                                variant = "moon",
                                transparent = false,
                                enable = {
                                    terminal = true
                                },
                                styles = {
                                    bold = true,
                                    italic = false,
                                    transparency = false,
                                },
                                highlight_groups = {
                                    Comment = { italic = true }
                                }
                            })
                        end,
                    },
                    rose_pine_light = {
                        colorscheme = 'rose-pine',
                        background = 'light',
                        config = function()
                            require("rose-pine").setup({
                                variant = "dawn",
                                transparent = false,
                                enable = {
                                    terminal = true
                                },
                                styles = {
                                    bold = true,
                                    italic = false,
                                    transparency = false,
                                },
                            })
                        end,
                    },
                },
            })
        end,
        keys = {
            {'<leader>1', "<cmd>VibeCheck rose_pine<cr>", mode = 'n'},
            {'<leader>2', "<cmd>VibeCheck rose_pine_light<cr>", mode = 'n'},
        }
    },
}
