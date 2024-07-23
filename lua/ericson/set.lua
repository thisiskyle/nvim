vim.opt.wildmenu = true
vim.opt.wildoptions = 'pum'
vim.opt.wildignore = ".git/*,node_modules/*,*.meta"
vim.opt.incsearch  = true
vim.opt.hlsearch  = true
vim.opt.wrapscan = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.ruler = false
vim.opt.termguicolors = true
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab  = true
vim.opt.autoindent  = true
vim.opt.scrolloff = 8
vim.opt.belloff = 'all'
vim.opt.signcolumn = "no"
vim.opt.mouse = ""
vim.opt.laststatus = 2
vim.opt.statusline = ""
    .. "%#Constant# Project: "
    .. "%#String#%{fnamemodify(getcwd(), ':t')}"
    .. "    "
    .. "%#Constant#Buffer: "
    .. "%#String#%{expand('%:~:.')}"
    .. "    "
    .. "%#Constant#Git: "
    .. "%#String#%{%v:lua.require('ericson.utils').git_branch()%}"
    .. "    "
    .. "%#String#%{%v:lua.require('ericson.utils').diag_count()%}"
    .. "%#Constant#%h%m%r%w"
    .. "%=" -- middle
    .. "%=" -- right
