vim.g.mapleader = " "
vim.g.cul = false

vim.keymap.set(
    'n',
    '<leader>tn',
    '<cmd>set nu!<cr>',
    { desc = 'Toggle number line' }
)

vim.keymap.set(
    'n',
    '<leader>tr',
    '<cmd>set rnu!<cr>',
    { desc = 'Toggle relative number line' }
)

vim.keymap.set(
    'n',
    '<leader>.',
    ':sp<cr>:term<cr>a',
    { desc = 'Open terminal' }
)

vim.keymap.set(
    'n',
    '<leader>c',
    'gcc',
    { desc = 'Toggle comment line', remap = true }
)

vim.keymap.set(
    'v',
    '<leader>c',
    'gc',
    { desc = 'Toggle comment block', remap = true }
)

vim.keymap.set(
    'n',
    '<leader>tl',
    function()
        if(vim.g.cul) then
            vim.cmd(":set nocul")
            vim.g.cul = false
        else
            vim.cmd(":set cul")
            vim.g.cul = true
        end
    end,
    { desc = 'Toggle cursorline' }
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
    '<leader>,',
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
