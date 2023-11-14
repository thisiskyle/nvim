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


vim.api.nvim_create_autocmd({"FileType", "BufEnter", "FocusGained"}, {
	callback = function()
		vim.b.branch_name = require('ericson.utils').set_branch_name()
	end
})


vim.opt.statusline = ""
    .. " "
    .. "[%n]"
    .. "%="
    .. "%{%v:lua.require('ericson.utils').get_diag_count()%}"
    .. "%="
    .. "%{%v:lua.require('ericson.utils').git_branch()%}"
    .. "  "
    .. "%m"
    .. " "
    .. "%t"
    .. "  "
    .. "%l,%c"
    .. " "

require('ericson.theme').set_theme("cat_dark")
