return {
    enabled = true,
    specs = {
        {
            src = "https://github.com/nvim-treesitter/nvim-treesitter",
        },
    },
    setup = function()
        require('nvim-treesitter').install({ 'lua', 'typescript', 'bash' })
    end
}
