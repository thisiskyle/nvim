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
    '<leader>u',
    function()
        vim.cmd(":Undotree")
    end,
    { desc = 'undotree toggle' }
)


local themes = {
    [1] = { color = "rose-pine-moon" },
    [2] = { color = "default" },
}

for i,_ in ipairs(themes) do
    if(themes[i] ~= nil) then
        vim.keymap.set(
            { 'n' },
            '<leader>' .. i,
            function()
                require("personal.utils").color_me(themes[i])
            end,
            { desc = 'colorscheme: ' .. themes[i].color }
        )
    end
end

vim.keymap.set(
    { 'n' },
    '<leader>9',
    function()
        require("personal.utils").color_me({ color = vim.g.colors_name, transparent = false })
    end,
    { desc = 'colorscheme: transparency off' }
)

vim.keymap.set(
    { 'n' },
    '<leader>0',
    function()
        require("personal.utils").color_me({ color = vim.g.colors_name, transparent = true })
    end,
    { desc = 'colorscheme: transparency on' }
)
