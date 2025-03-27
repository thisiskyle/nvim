vim.g.mapleader = " "

vim.keymap.set(
    { 'n' },
    '<leader>tn',
    '<cmd>set nu!<cr>',
    { desc = 'toggle: number line' }
)

vim.keymap.set(
    { 'n' },
    '<leader>ts',
    function()
        local num = vim.opt.laststatus:get()
        vim.opt.laststatus = (num % 2) + 1
    end,
    { desc = 'toggle: statusline' }
)

vim.keymap.set(
    { 'n' },
    '<leader>\'',
    function ()
        vim.cmd(":enew")
        vim.cmd(":file scratch")
        vim.opt_local.buftype = "nofile"
        vim.opt_local.bufhidden = "hide"
        vim.opt_local.filetype = "markdown"
        vim.opt_local.swapfile = false
    end,
    { desc = 'open: scratch buffer' }
)

vim.keymap.set(
    { 'n' },
    '<leader>;',
    ':sp<cr>:term<cr>a',
    { desc = 'open: terminal' }
)

vim.keymap.set(
    { 'n' },
    '<leader>/',
    function ()
        local path = "$HOME/.notes/"
        vim.cmd(":cd " .. path)
        vim.cmd(":e " .. path)
    end,
    { desc = 'open: notes' }
)

vim.keymap.set(
    { 'n' },
    '<leader>.',
    function ()
        local path = vim.fn.stdpath("config")
        vim.cmd(":cd " .. path)
        vim.cmd(":e " .. path)
    end,
    { desc = 'open: config' }
)

vim.keymap.set(
    { 'n' },
    '<leader>ld',
    '<cmd>lua vim.lsp.buf.definition()<cr>',
    { desc = 'lsp: jump definition' }
)

vim.keymap.set(
    { 'n' },
    '<leader>lt',
    '<cmd>lua vim.lsp.buf.type_definition()<cr>',
    { desc = 'lsp: jump type' }
)

vim.keymap.set(
    { 'n' },
    '<leader>lf',
    '<cmd>lua vim.lsp.buf.hover()<cr>',
    { desc = 'lsp: open float' }
)

vim.keymap.set(
    { 'n' },
    '<leader>df',
    '<cmd>lua vim.diagnostic.open_float()<cr>',
    { desc = 'diagnostic: open float' }
)

vim.keymap.set(
    { 'n' },
    '<leader>dq',
    '<cmd>lua vim.diagnostic.setqflist()<cr>',
    { desc = 'diagnostic: quickfix' }
)

vim.keymap.set(
    { 'n' },
    '<leader>dl',
    '<cmd>lua vim.diagnostic.setloclist()<cr>',
    { desc = 'diagnostic: local list' }
)

vim.keymap.set(
    { 'n' },
    '<leader>dn',
    '<cmd>lua vim.diagnostic.goto_next()<cr>',
    { desc = 'diagnostic: go to next' }
)

vim.keymap.set(
    { 'n' },
    '<leader>dp',
    '<cmd>lua vim.diagnostic.goto_prev()<cr>',
    { desc = 'diagnostic: go to prev' }
)

vim.keymap.set(
    { 'n' },
    '<leader>ds',
    '<cmd>lua vim.diagnostic.config({ virtual_text = true })<cr>',
    { desc = 'diagnostic: turn on virtual text' }
)

vim.keymap.set(
    { 'n' },
    '<leader>dh',
    '<cmd>lua vim.diagnostic.config({ virtual_text = false })<cr>',
    { desc = 'diagnostic: turn off virtual text' }
)
