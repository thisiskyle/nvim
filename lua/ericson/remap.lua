
vim.g.mapleader = " "

-- open file explorer
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)

-- move highlighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- CellularAutomaton
vim.keymap.set('n', '<leader>rain', '<cmd>CellularAutomaton make_it_rain<CR>')
vim.keymap.set('n', '<leader>life', '<cmd>CellularAutomaton game_of_life<CR>')

-- window navigation
vim.keymap.set('n', '<c-h>', '<c-w>h', {silent = true})
vim.keymap.set('n', '<c-j>', '<c-w>j', {silent = true})
vim.keymap.set('n', '<c-k>', '<c-w>k', {silent = true})
vim.keymap.set('n', '<c-l>', '<c-w>l', {silent = true})

-- cd to directory of current file
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>')

-- paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')

-- yank to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- page up and down and set the cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- get next search item and put in the center of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- color presets
vim.keymap.set('n', '<leader>1', '<cmd>lua ColorTheThings({ color = "drab", tp = false })<CR>')
vim.keymap.set('n', '<leader>2', '<cmd>lua ColorTheThings({ color = "drab-night", tp = false })<CR>')
vim.keymap.set('n', '<leader>3', '<cmd>lua ColorTheThings({ color = "drab-night", tp = true })<CR>')

vim.keymap.set('n', '<leader>4', '<cmd>lua ColorTheThings({ color = "catppuccin-latte", tp = false })<CR>')
vim.keymap.set('n', '<leader>5', '<cmd>lua ColorTheThings({ color = "catppuccin-frappe", tp = false })<CR>')
vim.keymap.set('n', '<leader>6', '<cmd>lua ColorTheThings({ color = "catppuccin-frappe", tp = true })<CR>')

vim.keymap.set('n', '<leader>7', '<cmd>lua ColorTheThings({ color = "rose-pine-dawn", tp = false })<CR>')
vim.keymap.set('n', '<leader>8', '<cmd>lua ColorTheThings({ color = "rose-pine-moon", tp = false })<CR>')
vim.keymap.set('n', '<leader>9', '<cmd>lua ColorTheThings({ color = "rose-pine-moon", tp = true })<CR>')

