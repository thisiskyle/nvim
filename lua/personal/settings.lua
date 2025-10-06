require("personal.utils").gitbranch()

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
vim.opt.scrolloff = 4
vim.opt.belloff = 'all'
vim.opt.signcolumn = "no"
vim.opt.mouse = ""
vim.opt.laststatus = 2
vim.opt.statusline = ""
    -- left
    .. " "
    .. "Cwd: %{fnamemodify(getcwd(), ':t')}"
    .. "   "
    .. "Buf: %f"
    .. "   "
    .. "Git: %{g:gitbranch}"
    .. "   "
    .. "%{&buftype=='' ? '' : '['.&buftype.']'}"
    .. "   "
    .. "%m%h%r%w"
    -- mid
    .. "%="
    -- right
    .. "%="
    .. " "





