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
vim.opt.statusline = " %F %m%h%r%w"

vim.opt.rtp:append(vim.fn.expand(vim.fn.stdpath("config") .. "/lua/ericson"))
vim.opt.rtp:append(vim.fn.expand(vim.fn.stdpath("config") .. "/lua/ericson/after"))

-- enable all lsp
local configs = {}
for _, v in ipairs(vim.api.nvim_get_runtime_file('/lua/ericson/lsp/*', true)) do
    local name = vim.fn.fnamemodify(v, ':t:r')
    configs[name] = true
end
vim.lsp.enable(vim.tbl_keys(configs))

vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
    signs = false,
    underline = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "single",
        source = "always",
        header = "",
        prefix = "",
    },
})
