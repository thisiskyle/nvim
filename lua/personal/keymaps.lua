vim.g.mapleader = " "

vim.keymap.set(
    { 'n' },
    '<leader>cd',
    '<cmd>cd %:p:h<cr>',
    { desc = 'util: change directory to current buffer' }
)

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
        local name = "scratch_pad"
        if(vim.fn.bufexists(name) == 0) then
            vim.cmd(":enew")
            vim.cmd(":file " .. name)
        else
            vim.cmd(":b " .. name)
        end
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
        vim.cmd(":Ex $HOME/.notes/")
    end,
    { desc = 'open: notes' }
)

vim.keymap.set(
    { 'n' },
    '<leader>.',
    function ()
        vim.cmd(":Ex " .. vim.fn.stdpath("config"))
    end,
    { desc = 'open: config' }
)

