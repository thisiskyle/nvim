vim.opt.wildmenu = true
vim.opt.wildoptions = 'pum'
vim.opt.wildignore = ".git/*,node_modules/*,*.meta,tags"
vim.opt.incsearch  = true
vim.opt.hlsearch  = true
vim.opt.wrapscan = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.shadafile = "NONE"
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
vim.opt.statusline = table.concat(require("personal.utils").statusline(
    {
        { label = "Cwd", content = "%{fnamemodify(getcwd(), ':t')}" },
        { label = "Buf", content = "%f" },
        { label = "Git", content = "%{g:gitbranch}" },
        { label = "Lsp", content = "%{v:lua.require('personal.utils').lsp_clients()}" },
        { content = "%m%r%w%{&buftype=='' ? '' : '['.&buftype.']'}" },
    }
))

-- add this to path so our lua/personal folder can contain all my config instead of using the root nvim config folder
vim.opt.rtp:append(vim.fn.expand(vim.fn.stdpath("config") .. "/lua/personal"))
vim.opt.rtp:append(vim.fn.expand(vim.fn.stdpath("config") .. "/lua/personal/after"))

require("personal.utils").Color_Me({ color = "rose-pine", transparent = true })
