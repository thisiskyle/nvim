local tscope = require('telescope.builtin')
local tscopeext = require('telescope').extensions
local theme = require('ericson.theme')
local utils = require('ericson.utils')

vim.g.mapleader = " "

vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Previous diagnostic" })

vim.keymap.set('n', ']b', "<cmd>bn<CR>", { desc = "Next buffer" })
vim.keymap.set('n', '[b', "<cmd>bp<CR>", { desc = "Previous buffer" })

vim.keymap.set('n', '<C-h>', "<C-w>h", { desc = "Window move left" })
vim.keymap.set('n', '<C-j>', "<C-w>j", { desc = "Window move down" })
vim.keymap.set('n', '<C-k>', "<C-w>k", { desc = "Window move up" })
vim.keymap.set('n', '<C-l>', "<C-w>l", { desc = "Window move right" })

vim.keymap.set('n', '<leader>ff', tscope.find_files, { desc = "Find all files" })
vim.keymap.set('n', '<leader>ft', tscope.tags, { desc = "Find tags" })
vim.keymap.set('n', '<leader>fg', tscope.git_files, { desc = "Find git-files" })
vim.keymap.set('n', '<leader>fk', tscope.keymaps, { desc = "Find keymap" })
vim.keymap.set('n', '<leader>fh', tscope.help_tags, { desc = "Find help" })
vim.keymap.set('n', '<leader>fq', tscope.quickfix, { desc = "Find quickfix" })
vim.keymap.set('n', '<leader>fd', tscope.diagnostics, { desc = "Find diagnostics" })
vim.keymap.set('n', '<leader>fws', tscope.lsp_dynamic_workspace_symbols, { desc = "Find lsp workspace symbols" })
vim.keymap.set('n', '<leader>fr', tscope.lsp_references, { desc = "Find lsp references" })
vim.keymap.set('n', '<leader>fi', tscope.lsp_implementations, { desc = "Find lsp implementations" })
vim.keymap.set('n', '<leader>fb', tscope.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>u', tscopeext.undo.undo, { desc = "Open undo history" })

vim.keymap.set('n', '<leader>ex', "<cmd>Ex<cr>", { desc = "Open explorer" })

vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, { desc = "Hover info" })
vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code actions" })
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { desc = "Rename" })
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = "View diagnostic" })

vim.keymap.set('n', '<leader>td', utils.toggle_diagnostics, { desc = "Toggle diagnostics" })
vim.keymap.set('n', '<leader>sb', utils.open_scratch_pad, { desc = "Open scratch buffer" })
vim.keymap.set('n', '<leader>vg', utils.vimgrep, { desc = "Vimgrep" })

vim.keymap.set('n', '<leader>p', '"+p', { desc = "Paste from clipboard" })
vim.keymap.set('n', '<leader>y', '"+y', { desc = "Yank to clipboard" })
vim.keymap.set('x', '<leader>y', '"+y', { desc = "Yank to clipboard" })
vim.keymap.set('n', '<leader>tag', "<cmd>!ctags -R --exclude=.git --exclude=node_modules<CR>", { desc = "Run ctags" })
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>', { desc = "Change directory to current file" })
vim.keymap.set('n', '<leader>tn', "<cmd>set nu!<CR>", { desc = "Toggle line numbers" })

-- random stuff
vim.keymap.set('n', '<leader>rain', '<cmd>CellularAutomaton make_it_rain<CR>', { desc = "Make it rain" })
vim.keymap.set('n', '<leader>life', '<cmd>CellularAutomaton game_of_life<CR>', { desc = "Game of life" })
vim.keymap.set('n', '<leader>0', function() theme.pick_random() end, { desc = "Pick a random theme" })
vim.keymap.set('n', '<leader>1', function() theme.set_theme("cat_light") end)
vim.keymap.set('n', '<leader>2', function() theme.set_theme("cat_dark") end)
vim.keymap.set('n', '<leader>3', function() theme.set_theme("cat_transparent") end)
vim.keymap.set('n', '<leader>4', function() theme.set_theme("rose_light") end)
vim.keymap.set('n', '<leader>5', function() theme.set_theme("rose_dark") end)
vim.keymap.set('n', '<leader>7', function() theme.set_theme("rose_transparent") end)
vim.keymap.set('n', '<leader>9', function() theme.set_theme("drab") end)
