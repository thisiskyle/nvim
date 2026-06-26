vim.keymap.set(
    { 'n' },
    '<leader>\'',
    function()
	    require("personal.utils").open_scratchpad()
    end,
    { desc = 'open: scratch buffer' }
)

vim.keymap.set(
    { 'n' },
    '<leader>/',
    function()
	    vim.cmd(":Ex $HOME/.notes/")
    end,
    { desc = 'open: notes' }
)

vim.keymap.set(
    { 'n' },
    '<leader>.',
    function()
        vim.cmd(":Ex " .. vim.fn.stdpath("config"))
    end,
    { desc = 'open: config' }
)

vim.keymap.set(
    { 'n' },
    '<leader>0',
    function()
        vim.g.transparent_bg = not vim.g.transparent_bg
        vim.cmd.colorscheme(vim.g.colors_name)
    end,
    { desc = 'colorscheme: transparency toggle' }
)
