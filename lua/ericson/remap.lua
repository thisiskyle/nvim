
local tscope = require('telescope.builtin')
local diag_active = true

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = "Open file explorer" })
vim.keymap.set('n', '<leader>ff', tscope.find_files, { desc = "Find all files" })
vim.keymap.set('n', '<leader>fb', tscope.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>ft', tscope.tags, { desc = "Find tags" })
vim.keymap.set('n', '<leader>fg', tscope.git_files, { desc = "Find git files" })
vim.keymap.set('n', '<leader>fk', tscope.keymaps, { desc = "Find git files" })
vim.keymap.set('n', '<leader>fs', function() vim.cmd.vimgrep(vim.fn.input("vimgrep > ") .. " ./**/* | cw") end, { desc = "Search in files" })
vim.keymap.set('n', ']b', "<cmd>bn<CR>", { desc = "Next Buffer" })
vim.keymap.set('n', '[b', "<cmd>bp<CR>", { desc = "Previous Buffer" })


vim.keymap.set('n', '<leader>tag', "<cmd>!ctags -R --exclude=.git --exclude=node_modules<CR>", { desc = "Run ctags" })
vim.keymap.set('n', '<leader>vh', tscope.help_tags, { desc = "Vim help" })
vim.keymap.set('n', '<leader>tn', "<cmd>set nu!<CR>", { desc = "Toggle line numbers" })
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>', { desc = "Change directory to current file" })


vim.keymap.set('n', '<leader>ts',
    function()
        vim.opt.signcolumn = vim.opt.signcolumn:get() == "yes" and "no" or "yes" 
    end,
    { desc = "Toggle sign column" })


vim.keymap.set('n', '<leader>td',
    function()
        diag_active = not diag_active
        if(diag_active) then
            vim.diagnostic.show()
        else
            vim.diagnostic.hide()
            vim.opt.signcolumn = "no"
        end
    end,
    { desc = "Toggle diagnostics" })


vim.keymap.set('n', '<leader>p', '"+p', { desc = "Paste forward from clipboard" })
vim.keymap.set('x', '<leader>p', '"+p', { desc = "Paste forward from clipboard" })
vim.keymap.set('n', '<leader>P', '"+P', { desc = "Paste backward from clipboard" })
vim.keymap.set('x', '<leader>P', '"+P', { desc = "Paste backward from clipboard" })
vim.keymap.set('n', '<leader>y', '"+y', { desc = "Yank to clipboard" })
vim.keymap.set('x', '<leader>y', '"+y', { desc = "Yank to clipboard" })

vim.keymap.set('n', '<leader>1', '<cmd>lua ColorTheThings({ color = "drab", tp = false })<CR>', { desc = "drab" })
vim.keymap.set('n', '<leader>2', '<cmd>lua ColorTheThings({ color = "drab-night", tp = false })<CR>', { desc = "drab-night" })
vim.keymap.set('n', '<leader>3', '<cmd>lua ColorTheThings({ color = "drab-night", tp = true })<CR>', { desc = "drab-night transparent" })
vim.keymap.set('n', '<leader>4', '<cmd>lua ColorTheThings({ color = "catppuccin-latte", tp = false })<CR>', { desc = "catppuccin-latte" })
vim.keymap.set('n', '<leader>5', '<cmd>lua ColorTheThings({ color = "catppuccin-frappe", tp = false })<CR>', { desc = "catppuccin-frappe" })
vim.keymap.set('n', '<leader>6', '<cmd>lua ColorTheThings({ color = "catppuccin-frappe", tp = true })<CR>', { desc = "catppuccin-frappe transparent" })

vim.keymap.set('n', '<leader>rain', '<cmd>CellularAutomaton make_it_rain<CR>', { desc = "Make it rain" })
vim.keymap.set('n', '<leader>life', '<cmd>CellularAutomaton game_of_life<CR>', { desc = "Game of life" })
