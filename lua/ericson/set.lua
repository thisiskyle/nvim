--
-- just saving these here. it was a pain to find the right size
--    ▁▂▃▄▅▆▇█
--

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
vim.opt.modelines = 0
vim.opt.scrolloff = 8
vim.opt.filetype = 'on'
vim.opt.syntax = 'on'
vim.opt.belloff = 'all'
vim.opt.tags = './tags,tags;'
vim.opt.guifont = 'agave:h11'
vim.opt.signcolumn = "no"

vim.opt.statusline = ""
    .. "%="
    .. "%{%v:lua.require('ericson.utils').get_diag_count()%}"
    .. "%="
    .. "%m"
    .. " "
    .. "%t"
    .. "   "
    .. "%l,%c"
    .. "   "

require('ericson.theme').set_theme("rose_light")
