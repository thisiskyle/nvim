
local tscope = require('telescope.builtin')

vim.g.mapleader = " "

-- file related
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = "Open file explorer" })
vim.keymap.set('n', '<leader>ff', tscope.find_files, { desc = "Find all files" })
vim.keymap.set('n', '<leader>fg', tscope.git_files, { desc = "Find git files" })
vim.keymap.set('n', '<leader>fs', function() vim.cmd.vimgrep(vim.fn.input("vimgrep > ") .. " ./**/* | cw") end, { desc = "Search in files" })

vim.keymap.set('n', '<leader>vh', tscope.help_tags, { desc = "Vim help" })

vim.keymap.set('n', '<c-h>', '<c-w>h', {silent = true})
vim.keymap.set('n', '<c-j>', '<c-w>j', {silent = true})
vim.keymap.set('n', '<c-k>', '<c-w>k', {silent = true})
vim.keymap.set('n', '<c-l>', '<c-w>l', {silent = true})

vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>', { desc = "Change directory to current file" })

vim.keymap.set('n', '<leader>p', '"+p', { desc = "Paste forward from clipboard" })
vim.keymap.set('n', '<leader>P', '"+P', { desc = "Paste backward from clipboard" })
vim.keymap.set('n', '<leader>y', '"+y', { desc = "Yank to clipboard" })
vim.keymap.set('n', '<leader>Y', '0"+Y', { desc = "Yank whole line to clipboard" })

-- move visual selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- color presets
vim.keymap.set('n', '<leader>1', '<cmd>lua ColorTheThings({ color = "drab", tp = false })<CR>', { desc = "drab" })
vim.keymap.set('n', '<leader>2', '<cmd>lua ColorTheThings({ color = "drab-night", tp = false })<CR>', { desc = "drab-night" })
vim.keymap.set('n', '<leader>3', '<cmd>lua ColorTheThings({ color = "drab-night", tp = true })<CR>', { desc = "drab-night transparent" })
vim.keymap.set('n', '<leader>4', '<cmd>lua ColorTheThings({ color = "catppuccin-latte", tp = false })<CR>', { desc = "catppuccin-latte" })
vim.keymap.set('n', '<leader>5', '<cmd>lua ColorTheThings({ color = "catppuccin-frappe", tp = false })<CR>', { desc = "catppuccin-frappe" })
vim.keymap.set('n', '<leader>6', '<cmd>lua ColorTheThings({ color = "catppuccin-frappe", tp = true })<CR>', { desc = "catppuccin-frappe transparent" })

-- fun stuff
vim.keymap.set('n', '<leader>rain', '<cmd>CellularAutomaton make_it_rain<CR>', { desc = "Make it rain" })
vim.keymap.set('n', '<leader>life', '<cmd>CellularAutomaton game_of_life<CR>', { desc = "Game of life" })
