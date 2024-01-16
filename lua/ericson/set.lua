vim.opt.wildmenu = true
vim.opt.wildoptions = 'pum'
vim.opt.incsearch  = true
vim.opt.hlsearch  = true
vim.opt.wrapscan = false
vim.opt.hidden = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab  = true
vim.opt.autoindent  = true
vim.opt.scrolloff = 8
vim.opt.belloff = 'all'
vim.opt.signcolumn = "no"
vim.opt.statusline = ""
    .. " %F %m%=%="
    .. "%{%v:lua.require('ericson.utils').get_diag_count()%}"
