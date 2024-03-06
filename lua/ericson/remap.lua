local ts = require('telescope.builtin')
local tse = require('telescope').extensions
local vibe = require('vibe-check-nvim')

vim.g.mapleader = " "

-- telescope
vim.keymap.set('n', '<leader>ff', ts.find_files)
vim.keymap.set('n', '<leader>fg', ts.live_grep)
vim.keymap.set('n', '<leader>fh', ts.help_tags)
vim.keymap.set('n', '<leader>fw', ts.lsp_dynamic_workspace_symbols)
vim.keymap.set('n', '<leader>fr', ts.lsp_references)
vim.keymap.set('n', '<leader>fi', ts.lsp_implementations)
vim.keymap.set('n', '<leader>fu', tse.undo.undo)

-- lsp
vim.keymap.set('n', '<leader>jd', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', '<leader>jt', function() vim.lsp.buf.type_definition() end)
vim.keymap.set('n', '<leader>vk', function() vim.lsp.buf.hover() end)

-- diagnostic
vim.keymap.set('n', '<leader>di', function() vim.diagnostic.open_float() end)
vim.keymap.set('n', '<leader>dq', function() vim.diagnostic.setqflist() end)
vim.keymap.set('n', '<leader>dl', function() vim.diagnostic.setloclist() end)
vim.keymap.set('n', '<leader>dh', function() vim.diagnostic.hide() end)
vim.keymap.set('n', '<leader>ds', function() vim.diagnostic.show() end)
vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.goto_next() end)
vim.keymap.set('n', '<leader>dp', function() vim.diagnostic.goto_prev() end)

-- misc
vim.keymap.set('n', '<leader>tag', "<cmd>!ctags -R --exclude=.git --exclude=node_modules<CR>")
vim.keymap.set('n', '<leader>tn', "<cmd>set nu!<CR>")
vim.keymap.set('n', '<leader>tr', "<cmd>set rnu!<CR>")

vim.keymap.set('n', '<leader>1', function() vibe.set_the_mood("drab") end)
vim.keymap.set('n', '<leader>2', function() vibe.set_the_mood("drab_ghost") end)
vim.keymap.set('n', '<leader>3', function() vibe.set_the_mood("rose") end)
vim.keymap.set('n', '<leader>4', function() vibe.set_the_mood("rose_ghost") end)
