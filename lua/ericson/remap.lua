local tscope = require('telescope.builtin')
local tscopeext = require('telescope').extensions
local vibe = require('vibe-nvim')

vim.g.mapleader = " "

vim.keymap.set('n', '<C-h>', "<C-w>h", { desc = "Window move left" })
vim.keymap.set('n', '<C-j>', "<C-w>j", { desc = "Window move down" })
vim.keymap.set('n', '<C-k>', "<C-w>k", { desc = "Window move up" })
vim.keymap.set('n', '<C-l>', "<C-w>l", { desc = "Window move right" })

vim.keymap.set('n', '<leader>ff', tscope.find_files, { desc = "Find all files" })
vim.keymap.set('n', '<leader>ft', tscope.tags, { desc = "Find tags" })
vim.keymap.set('n', '<leader>fg', tscope.live_grep, { desc = "Grep all files" })
vim.keymap.set('n', '<leader>fk', tscope.keymaps, { desc = "Find keymap" })
vim.keymap.set('n', '<leader>fh', tscope.help_tags, { desc = "Find help" })
vim.keymap.set('n', '<leader>fq', tscope.quickfix, { desc = "Find quickfix" })
vim.keymap.set('n', '<leader>fd', tscope.diagnostics, { desc = "Find diagnostics" })
vim.keymap.set('n', '<leader>fw', tscope.lsp_dynamic_workspace_symbols, { desc = "Find lsp workspace symbols" })
vim.keymap.set('n', '<leader>fr', tscope.lsp_references, { desc = "Find lsp references" })
vim.keymap.set('n', '<leader>fi', tscope.lsp_implementations, { desc = "Find lsp implementations" })
vim.keymap.set('n', '<leader>fb', tscope.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fu', tscopeext.undo.undo, { desc = "Open undo history" })

vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, { desc = "Code actions" })
vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, { desc = "Rename" })
vim.keymap.set('n', '<leader>vi', function() vim.lsp.buf.hover() end, { desc = "Hover info" })
vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, { desc = "View diagnostic" })

vim.keymap.set('n', '<leader>p', '"+p', { desc = "Paste forward from clipboard" })
vim.keymap.set('x', '<leader>p', '"+p', { desc = "Paste forward from clipboard" })
vim.keymap.set('n', '<leader>P', '"+P', { desc = "Paste backward from clipboard" })
vim.keymap.set('x', '<leader>P', '"+P', { desc = "Paste backward from clipboard" })
vim.keymap.set('n', '<leader>y', '"+y', { desc = "Yank to clipboard" })
vim.keymap.set('x', '<leader>y', '"+y', { desc = "Yank to clipboard" })

vim.keymap.set('n', '<leader>tag', "<cmd>!ctags -R --exclude=.git --exclude=node_modules<CR>", { desc = "Run ctags" })
vim.keymap.set('n', '<leader>tn', "<cmd>set nu!<CR>", { desc = "Toggle line numbers" })

vim.keymap.set('n', '<leader>1', function() vibe.set_the_mood("rose_light") end)
vim.keymap.set('n', '<leader>2', function() vibe.set_the_mood("rose_dark") end)
vim.keymap.set('n', '<leader>3', function() vibe.set_the_mood("rose_transparent") end)
vim.keymap.set('n', '<leader>4', function() vibe.set_the_mood("drab") end)
vim.keymap.set('n', '<leader>5', function() vibe.set_the_mood("drab_cozy") end)
