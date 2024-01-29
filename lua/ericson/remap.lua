local ts = require('telescope.builtin')
local tse = require('telescope').extensions
local vibe = require('vibe-check-nvim')

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ff', ts.find_files)
vim.keymap.set('n', '<leader>fg', ts.live_grep)
vim.keymap.set('n', '<leader>fh', ts.help_tags)
vim.keymap.set('n', '<leader>fd', ts.diagnostics)
vim.keymap.set('n', '<leader>fb', ts.buffers)
vim.keymap.set('n', '<leader>fw', ts.lsp_dynamic_workspace_symbols)
vim.keymap.set('n', '<leader>fr', ts.lsp_references)
vim.keymap.set('n', '<leader>fi', ts.lsp_implementations)
vim.keymap.set('n', '<leader>fc', ts.command_history)
vim.keymap.set('n', '<leader>fu', tse.undo.undo)

vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', '<leader>vi', function() vim.lsp.buf.hover() end)
vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end)

vim.keymap.set('n', '<leader>tag', "<cmd>!ctags -R --exclude=.git --exclude=node_modules<CR>")

vim.keymap.set('n', '<leader>1', function() vibe.set_the_mood("drab") end)
vim.keymap.set('n', '<leader>2', function() vibe.set_the_mood("drab_night") end)
vim.keymap.set('n', '<leader>3', function() vibe.set_the_mood("drab_ghost") end)
vim.keymap.set('n', '<leader>4', function() vibe.set_the_mood("cat_light") end)
vim.keymap.set('n', '<leader>5', function() vibe.set_the_mood("cat") end)
vim.keymap.set('n', '<leader>6', function() vibe.set_the_mood("cat_ghost") end)
vim.keymap.set('n', '<leader>7', function() vibe.set_the_mood("gruv") end)
