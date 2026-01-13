vim.g.mapleader = " "

vim.keymap.set(
    { 'n' },
    '<leader>\'',
    function ()
        local name = "scratch_pad"
        if(vim.fn.bufexists(name) == 0) then
            vim.cmd(":enew")
            vim.cmd(":file " .. name)
        else
            vim.cmd(":b " .. name)
        end
        vim.opt_local.buftype = "nofile"
        vim.opt_local.bufhidden = "hide"
        vim.opt_local.filetype = "markdown"
        vim.opt_local.swapfile = false
    end,
    { desc = 'open: scratch buffer' }
)

vim.keymap.set(
    { 'n' },
    '<leader>/',
    function ()
        vim.cmd(":Ex $HOME/.notes/")
    end,
    { desc = 'open: notes' }
)

vim.keymap.set(
    { 'n' },
    '<leader>.',
    function ()
        vim.cmd(":Ex " .. vim.fn.stdpath("config"))
    end,
    { desc = 'open: config' }
)

vim.keymap.set(
    { 'n' },
    '<leader>1',
    function ()
        require("personal.utils").Color_Me({ color = "rose-pine" })
    end,
    { desc = 'colorscheme: rose-pine' }
)

vim.keymap.set(
    { 'n' },
    '<leader>9',
    function ()
        require("personal.utils").Color_Me({ color = vim.g.colors_name, transparent = false })
    end,
    { desc = 'colorscheme: transparency off' }
)

vim.keymap.set(
    { 'n' },
    '<leader>0',
    function ()
        require("personal.utils").Color_Me({ color = vim.g.colors_name, transparent = true })
    end,
    { desc = 'colorscheme: transparency on' }
)
