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
                '<leader>sr',
                mode = 'n',
                desc = 'sleepy: repeat last',
                ":SleepyRepeat<cr>",
            },
            {
                '<leader>ss',
                mode = 'v',
                desc = 'sleepy: run on visual selection',
                ":Sleepy<cr>",
            },

            {
                '<leader>sc',
                mode = 'v',
                desc = 'sleepy: show curl command',
                ":SleepyShowCurlCommands<cr>",
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
