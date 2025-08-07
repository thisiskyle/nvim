return {
    enabled = true,
    sources = {
        "https://github.com/thisiskyle/sleepy-nvim"
    },
    setup = function()
        require("sleepy").setup({
            global_after = function()
                vim.cmd(":%!jq")
            end,
        },
        vim.keymap.set(
            { 'v' },
            '<leader>nn',
            ":Sleepy<cr>",
            { desc = 'sleepy: run' }
        )
    end
}
