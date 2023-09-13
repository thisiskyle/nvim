
local tscope = require('telescope.builtin')
local diag_active = true

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ff', tscope.find_files, { desc = "Find all files" })
vim.keymap.set('n', '<leader>fb', tscope.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>ft', tscope.tags, { desc = "Find tags" })
vim.keymap.set('n', '<leader>fg', tscope.git_files, { desc = "Find git files" })
vim.keymap.set('n', '<leader>fk', tscope.keymaps, { desc = "Find keymap" })
vim.keymap.set('n', '<leader>fk', tscope.keymaps, { desc = "Find keymap" })
vim.keymap.set('n', '<leader>vh', tscope.help_tags, { desc = "Vim help" })
vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<CR>', { desc = "Open undo tree" })

vim.keymap.set('n', '<leader>fe', '<cmd>Ex<CR>', { desc = "Open file explorer" })
vim.keymap.set('n', ']b', "<cmd>bn<CR>", { desc = "Next buffer" })
vim.keymap.set('n', '[b', "<cmd>bp<CR>", { desc = "Previous buffer" })

vim.keymap.set('n', '<leader>tag', "<cmd>!ctags -R --exclude=.git --exclude=node_modules<CR>", { desc = "Run ctags" })
vim.keymap.set('n', '<leader>tn', "<cmd>set nu!<CR>", { desc = "Toggle line numbers" })
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>', { desc = "Change directory to current file" })

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
vim.keymap.set('n', '<leader>7', '<cmd>lua ColorTheThings({ color = "rose-pine-dawn", tp = false })<CR>', { desc = "catppuccin-latte" })
vim.keymap.set('n', '<leader>8', '<cmd>lua ColorTheThings({ color = "rose-pine-moon", tp = false })<CR>', { desc = "catppuccin-frappe" })
vim.keymap.set('n', '<leader>9', '<cmd>lua ColorTheThings({ color = "rose-pine-moon", tp = true })<CR>', { desc = "catppuccin-frappe transparent" })

vim.keymap.set('n', '<leader>rain', '<cmd>CellularAutomaton make_it_rain<CR>', { desc = "Make it rain" })
vim.keymap.set('n', '<leader>life', '<cmd>CellularAutomaton game_of_life<CR>', { desc = "Game of life" })



vim.keymap.set('n', '<leader>fs', function()
    vim.cmd.vimgrep(vim.fn.input("vimgrep > ") .. " ./**/* | cw")
end,
{ desc = "Search in files" })


vim.keymap.set('n', '<leader>ts', function()
    vim.opt.signcolumn = vim.opt.signcolumn:get() == "yes" and "no" or "yes"
end,
{ desc = "Toggle sign column" })


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


-- lsp related mappings
local lsp = require("lsp-zero")
local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.on_attach(function(client, bufnr)
    vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc = "Hover info" })
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false, desc = "View diagnostic" })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false, desc = "Next diagnostic" })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false, desc = "Previous diagnostic" })
    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "Go to definition" })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr, remap = false, desc = "View Workspace symbol" })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc = "View code actions" })
    vim.keymap.set("n", "<leader>vlr", function() vim.lsp.buf.references() end, { buffer = bufnr, remap = false, desc = "View references in current buffer" })
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false, desc = "Rename" })
end)
