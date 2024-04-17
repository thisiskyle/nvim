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

vim.opt.laststatus = 1
vim.opt.statusline = " "
    .. "%{expand('%:~:.')} %m"
    .. "%=" -- middle
    .. "%{%v:lua.require('ericson.utils').diag_count()%}"
    .. "%=" -- right

vim.keymap.set('n', '<leader>tn', "<cmd>set nu!<cr>")
vim.keymap.set('n', '<leader>tr', "<cmd>set rnu!<cr>")
