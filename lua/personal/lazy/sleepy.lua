return {
    {
        "thisiskyle/sleepy-nvim",
        enabled = true,
        lazy = false,
        priority = 50,
        opts = {
            global_after = function()
                vim.cmd(":%!jq")
            end,
        },
        keys = {
            {
                '<leader>ss',
                mode = 'v',
                desc = 'sleepy: run',
                ":Sleepy<cr>",
            },
            {
                '<leader>st',
                mode = 'n',
                desc = 'sleepy: insert template',
                ":SleepyTemplate<cr>",
            }
        },
    }
}
