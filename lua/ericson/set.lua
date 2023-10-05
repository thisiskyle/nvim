
vim.opt.wildmenu = true
vim.opt.wildoptions = 'pum'
vim.opt.incsearch  = true
vim.opt.hlsearch  = true
vim.opt.wrapscan = false
vim.opt.hidden = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.cursorline = false
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab  = true
vim.opt.autoindent  = true
vim.opt.ruler = false
vim.opt.laststatus = 2
vim.opt.modelines = 0
vim.opt.scrolloff = 8
vim.opt.filetype = 'on'
vim.opt.syntax = 'on'
vim.opt.belloff = 'all'
vim.opt.tags = './tags,tags;'
vim.opt.guifont = 'agave nerd font mono:h11'
vim.opt.signcolumn = "no"

require('ericson.theme').set_theme("cat_light")
