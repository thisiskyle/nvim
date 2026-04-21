pcall(vim.loader.enable)

vim.g.mapleader = " "

require("personal.vimpack")
require("personal.keymaps")
require("personal.settings")
require("personal.usercommands")
