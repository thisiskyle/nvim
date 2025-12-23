return {
    {
        -- "thisiskyle/anrcy",
        dir = "C:/Users/kyle.ericson/personal/dev/anrcy/",
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
                '<leader>ar',
                mode = 'n',
                desc = 'anrcy: repeat last',
                ":AnrcyRepeat<cr>",
            },
            {
                '<leader>aa',
                mode = 'v',
                desc = 'anrcy: run on visual selection',
                ":Anrcy<cr>",
            },
            {
                '<leader>ac',
                mode = 'v',
                desc = 'anrcy: show curl command',
                ":AnrcyShowCurl<cr>",
            },
            {
                '<leader>abb',
                mode = 'n',
                desc = 'anrcy: run the bookmarked job list',
                ":AnrcyBookmarkRun<cr>",
            },
            {
                '<leader>abm',
                mode = 'v',
                desc = 'anrcy: bookmark the visual selection',
                ":AnrcyBookmark<cr>",
            },
            {
                '<leader>at',
                mode = 'n',
                desc = 'anrcy: insert template',
                ":AnrcyTemplate<cr>",
            }
        },
    }
}
