


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim/"


if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end


vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        { 
            "nvim-treesitter/nvim-treesitter",
            config = function() 
                require('nvim-treesitter.configs').setup({

                    ensure_installed = { 
                        "vimdoc", 
                        "javascript", 
                        "typescript", 
                        "c",
                        "lua", 
                        "sql",
                        "html",
                        "json"
                    },

                    auto_install = false,
                })

                vim.cmd([[ TSUpdate ]])
            end
        },
        { 
            "catppuccin/nvim",
            config = function()
                require("catppuccin").setup({
                    flavour = "frappe", -- latte, frappe, macchiato, mocha
                    background = { light = "latte", dark = "frappe", },
                    transparent_background = false,
                    show_end_of_buffer = true,
                    term_colors = false,
                    no_italic = true,
                    no_bold = false,
                    no_underline = false,
                    integrations = {
                        treesitter = true,
                    },
                })
            end
        },
        { 
            "rose-pine/neovim",
            config = function()
                require('rose-pine').setup({
                    disable_italics = true
                })
            end
        },
        { "eandrju/cellular-automaton.nvim" }
    },
    { performance = { reset_packpath = false } }
)


vim.cmd.packadd("drab")
