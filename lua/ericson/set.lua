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
vim.opt.statusline = " "
    .. "File: %{expand('%:~:.')} %m"
    .. "  |  "
    .. "Line: %l"
    .. " "
    .. "Column: %c"
    .. "  |  "
    .. "Git: %{%v:lua.require('ericson.utils').git_branch()%}"
    .. "  |  "
    .. "%{%v:lua.require('ericson.utils').diag_count()%}"
    .. "%=" -- middle
    .. "%=" -- right

vim.keymap.set('n', '<leader>tn', "<cmd>set nu!<cr>")
vim.keymap.set('n', '<leader>tr', "<cmd>set rnu!<cr>")
vim.keymap.set('n', '<leader>ts', "<cmd>lua require('ericson.utils').toggle_status()<cr>")
vim.keymap.set('n', '<leader>q', "<cmd>lua require('ericson.utils').open_scratch_pad()<cr>")
vim.keymap.set('n', '<leader>x', ":sp<cr>:term<cr>a")

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.g.branch_name = require("ericson.utils").set_branch_name()
    end
})

