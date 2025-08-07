return {
    enabled = true,
    sources = {
        "https://github.com/thisiskyle/anrcy"
    },
    setup = function()
        require("anrcy").setup({
            global_after = function()
                vim.cmd(":%!jq")
            end,
        })

        vim.keymap.set(
            { 'v' },
            '<leader>aa',
            ":Anrcy<cr>",
            { desc = 'anrcy: run' }
        )

        vim.keymap.set(
            { 'v' },
            '<leader>ac',
            ":AnrcyShowCurlCommands<cr>",
            { desc = 'anrcy: show curl commands' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>at',
            ":AnrcyTemplate<cr>",
            { desc = 'anrcy: run' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>ar',
            ":AnrcyRepeat<cr>",
            { desc = 'anrcy: repeat last' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>abm',
            ":AnrcyBookmark<cr>",
            { desc = 'anrcy: bookmark selected jobs' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>abb',
            ":AnrcyBookmarkRun<cr>",
            { desc = 'anrcy: run bookmarked jobs' }
        )

    end
}
