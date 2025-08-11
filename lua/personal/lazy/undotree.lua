return {
    "mbbill/undotree",
    config = function()
        if(string.find(vim.loop.os_uname().sysname, "Windows")) then
            vim.g.undotree_DiffCommand = "FC"
        end
    end,

    keys = {
        {
            '<leader>u',
            function()
                vim.cmd.UndotreeToggle()
                vim.cmd.UndotreeFocus()
            end,
            mode = 'n'
        },
    }
}
