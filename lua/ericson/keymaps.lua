vim.g.mapleader = " "

vim.keymap.set('n', '<leader>tn', "<cmd>set nu!<cr>")

vim.keymap.set('n', '<leader>tr', "<cmd>set rnu!<cr>")

vim.keymap.set('n', '<leader>.', ":sp<cr>:term<cr>a")

vim.keymap.set('n', '<leader>ts', function()
    local num = vim.opt.laststatus:get()
    vim.opt.laststatus = (num % 2) + 1
end)

vim.keymap.set('n', '<leader>,', function ()
    vim.cmd(":enew")
    vim.cmd(":file scratch")
    vim.opt_local.buftype = "nofile"
    vim.opt_local.bufhidden = "hide"
    vim.opt_local.filetype = "markdown"
    vim.opt_local.swapfile = false
end)

