vim.g.mapleader = " "

vim.keymap.set('n', '<leader>tn', "<cmd>set nu!<cr>")
vim.keymap.set('n', '<leader>tr', "<cmd>set rnu!<cr>")
vim.keymap.set('n', '<leader>ts', "<cmd>lua require('ericson.utils').toggle_status()<cr>")
vim.keymap.set('n', '<leader>q', "<cmd>lua require('ericson.utils').open_scratch_pad()<cr>")
vim.keymap.set('n', '<leader>x', ":sp<cr>:term<cr>a")
