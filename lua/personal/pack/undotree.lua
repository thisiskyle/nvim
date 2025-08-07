return {
    enabled = true,
    sources = {
        "https://github.com/mbbill/undotree"
    },
    setup = function()

        if(vim.loop.os_uname().sysname == "Windows") then
            vim.g.undotree_DiffCommand = "FC"
        end

        vim.g.undotree_WindowLayout = 2

        vim.keymap.set(
            { 'n' },
            '<leader>u',
            vim.cmd.UndotreeToggle,
            { desc = 'undotree: toggle' }
        )

    end
}
