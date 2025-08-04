return {
    "mbbill/undotree",
    config = function()
        if(vim.loop.os_uname().sysname == "Windows") then
            vim.g.undotree_DiffCommand = "FC"
        end
        vim.g.undotree_WindowLayout = 2
    end,

    keys = {
        { '<leader>u', vim.cmd.UndotreeToggle, mode = 'n' },
    }
}
