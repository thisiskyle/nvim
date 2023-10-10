
local tscope = require('telescope.builtin')
local tscopeext = require('telescope').extensions
local theme = require('ericson.theme')
local diag_active = true

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ff', tscope.find_files, { desc = "Find all files" })
vim.keymap.set('n', '<leader>ft', tscope.tags, { desc = "Find tags" })
vim.keymap.set('n', '<leader>fg', tscope.git_files, { desc = "Find git-files" })
vim.keymap.set('n', '<leader>fk', tscope.keymaps, { desc = "Find keymap" })
vim.keymap.set('n', '<leader>fh', tscope.help_tags, { desc = "Find in help" })
vim.keymap.set('n', '<leader>fq', tscope.quickfix, { desc = "Find in quickfix" })
vim.keymap.set('n', '<leader>reg', tscope.registers, { desc = "Find registers" })
vim.keymap.set('n', '<leader>u', tscopeext.undo.undo, { desc = "Open undo history" })

vim.keymap.set('n', '<leader>fb', tscope.buffers, { desc = "Find buffers" })
vim.keymap.set('n', ']b', "<cmd>bn<CR>", { desc = "Next buffer" })
vim.keymap.set('n', '[b', "<cmd>bp<CR>", { desc = "Previous buffer" })

vim.keymap.set('n', '<leader>p', '"+p', { desc = "Paste from clipboard" })
vim.keymap.set('n', '<leader>y', '"+y', { desc = "Yank to clipboard" })
vim.keymap.set('x', '<leader>y', '"+y', { desc = "Yank to clipboard" })

vim.keymap.set('n', '<leader>fws', tscope.lsp_dynamic_workspace_symbols, { desc = "Find lsp workspace symbols" })
vim.keymap.set('n', '<leader>fr', tscope.lsp_references, { desc = "Find lsp references" })
vim.keymap.set('n', '<leader>fi', tscope.lsp_implementations, { desc = "Find lsp implementations" })
vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, { desc = "Hover info" })
vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code actions" })
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { desc = "Rename" })

vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = "View diagnostic" })

vim.keymap.set('n', '<leader>tn', "<cmd>set nu!<CR>", { desc = "Toggle line numbers" })
vim.keymap.set('n', '<leader>ts', function() vim.opt.signcolumn = vim.opt.signcolumn:get() == "yes" and "no" or "yes" end, { desc = "Toggle sign column" })
vim.keymap.set('n', '<leader>td', function()
    diag_active = not diag_active
    if(diag_active) then
        vim.diagnostic.enable()
    else
        vim.diagnostic.disable()
        vim.opt.signcolumn = "no"
    end
end,
{ desc = "Toggle diagnostics" })


-- random stuff
vim.keymap.set('n', '<leader>tag', "<cmd>!ctags -R --exclude=.git --exclude=node_modules<CR>", { desc = "Run ctags" })
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>', { desc = "Change directory to current file" })

vim.keymap.set('n', '<leader>rain', '<cmd>CellularAutomaton make_it_rain<CR>', { desc = "Make it rain" })
vim.keymap.set('n', '<leader>life', '<cmd>CellularAutomaton game_of_life<CR>', { desc = "Game of life" })

vim.keymap.set('n', '<leader>0', function() theme.pick_random() end, { desc = "Pick a random theme" })
vim.keymap.set('n', '<leader>1', function() theme.set_theme("rose_light") end, { desc = "rose-pine-dawn" })
vim.keymap.set('n', '<leader>2', function() theme.set_theme("rose_dark") end, { desc = "rose-pine-moon" })
vim.keymap.set('n', '<leader>3', function() theme.set_theme("rose_transparent") end, { desc = "rose-pine transparent" })

vim.keymap.set('n', '<leader>vg', function()
    vim.cmd.vimgrep(vim.fn.input("vimgrep > ") .. " ./**/*")
    tscope.quickfix()
end, { desc = "Vimgrep" })

vim.keymap.set('n', '<leader>pad', function()
    vim.cmd(":enew")
    vim.cmd(":file scratch")
    vim.opt_local.buftype = "nofile"
    vim.opt_local.bufhidden = "hide"
    vim.opt_local.swapfile = false
end,
{ desc = "Open scratch buffer" })
