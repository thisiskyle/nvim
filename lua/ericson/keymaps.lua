vim.g.mapleader = " "

vim.keymap.set(
    { 'v' },
    '<leader>nn',
    ":Sleepy<cr>",
    { desc = 'sleepy: run' }
)

vim.keymap.set(
    { 'n' },
    '<leader>na',
    ":SleepyAnimate<cr>",
    { desc = 'sleepy: run animation test' }
)

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
            vim.opt_local.buftype = "nofile"
            vim.opt_local.bufhidden = "hide"
            vim.opt_local.filetype = "markdown"
            vim.opt_local.swapfile = false
        else
            vim.cmd(":b " .. name)
        end
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
        vim.cmd(":Ex " .. path)
    end,
    { desc = 'open: notes' }
)

vim.keymap.set(
    { 'n' },
    '<leader>.',
    function ()
        local path = vim.fn.stdpath("config")
        vim.cmd(":Ex " .. path)
    end,
    { desc = 'open: config' }
)

