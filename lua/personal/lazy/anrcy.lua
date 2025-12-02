return {
    {
        "thisiskyle/anrcy",
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
                desc = 'anrcy: repeat last',
                ":ANRCYRepeat<cr>",
            },
            {
                '<leader>ss',
                mode = 'v',
                desc = 'anrcy: run on visual selection',
                ":ANRCY<cr>",
            },
            {
                '<leader>sc',
                mode = 'v',
                desc = 'anrcy: show curl command',
                ":ANRCYShowCurlCommands<cr>",
            },
            {
                '<leader>sbr',
                mode = 'n',
                desc = 'anrcy: run the bookmarked job list',
                ":ANRCYBookmarkRun<cr>",
            },
            {
                '<leader>sbs',
                mode = 'v',
                desc = 'anrcy: bookmark the visual selection',
                ":ANRCYBookmark<cr>",
            },
            {
                '<leader>st',
                mode = 'n',
                desc = 'anrcy: insert template',
                ":ANRCYTemplate<cr>",
            }
        },
    }
}
