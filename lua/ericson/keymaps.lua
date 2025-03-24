vim.g.mapleader = " "

vim.keymap.set(
    'n',
    '<leader>tn',
    '<cmd>set nu!<cr>',
    { desc = 'Toggle number line' }
)

vim.keymap.set(
    'n',
    '<leader>ts',
    function()
        local num = vim.opt.laststatus:get()
        vim.opt.laststatus = (num % 2) + 1
    end,
    { desc = 'Toggle statusline' }
)

vim.keymap.set(
    'n',
    '<leader>\'',
    function ()
        vim.cmd(":enew")
        vim.cmd(":file scratch")
        vim.opt_local.buftype = "nofile"
        vim.opt_local.bufhidden = "hide"
        vim.opt_local.filetype = "markdown"
        vim.opt_local.swapfile = false
    end,
    { desc = 'Open scratch buffer' }
)

vim.keymap.set(
    'n',
    '<leader>;',
    ':sp<cr>:term<cr>a',
    { desc = 'Open terminal' }
)

vim.keymap.set(
    'n',
    '<leader>/',
    function ()
        local path = "$HOME/.notes/"
        vim.cmd(":cd " .. path)
        vim.cmd(":e " .. path)
    end,
    { desc = 'Open notes' }
)

vim.keymap.set(
    'n',
    '<leader>.',
    function ()
        local path = vim.fn.stdpath("config")
        vim.cmd(":cd " .. path)
        vim.cmd(":e " .. path)
    end,
    { desc = 'Open config' }
)
