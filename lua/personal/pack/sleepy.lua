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
        })

        vim.keymap.set(
            { 'v' },
            '<leader>ss',
            ":Sleepy<cr>",
            { desc = 'sleepy: run' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>st',
            ":SleepyTemplate<cr>",
            { desc = 'sleepy: run' }
        )
    end
}
