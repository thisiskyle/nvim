pcall(vim.loader.enable)

vim.g.mapleader = " "

require("personal.utils.vimpack").load({
    dir = vim.fn.stdpath('config') .. "/lua/personal/pack/",
    enabled = {
        "anrcy",
        "blink",
        "nvim-lspconfig",
        "nvim-treesitter",
        "nvim-undotree",
        "rose-pine",
        "snacks",
    }
})

require("personal.core.keymaps")
require("personal.core.settings")
require("personal.core.usercommands")
