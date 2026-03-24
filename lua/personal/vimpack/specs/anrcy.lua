local _opts = {
    global_after = function()
        vim.cmd(":%!jq")
    end
}


return {
    enabled = true,
    specs = {
        {
            src = "https://github.com/thisiskyle/anrcy",
            data = _opts
        }
    },
    setup = function()
        require("anrcy").setup(_opts)

        vim.keymap.set({ 'v' }, '<leader>aa', ":Anrcy<cr>", { desc = 'anrcy: run' })
        vim.keymap.set({ 'v' }, '<leader>ac', ":AnrcyShowCurlCommands<cr>", { desc = 'anrcy: show curl commands' })
        vim.keymap.set({ 'n' }, '<leader>ah', ":AnrcyHistory<cr>", { desc = 'anrcy: show job history' })
        vim.keymap.set({ 'n' }, '<leader>at', ":AnrcyTemplate<cr>", { desc = 'anrcy: run' })
        vim.keymap.set({ 'n' }, '<leader>ar', ":AnrcyRepeat<cr>", { desc = 'anrcy: repeat last' })
        vim.keymap.set({ 'v' }, '<leader>ab', ":AnrcyBookmark<cr>", { desc = 'anrcy: bookmark selected jobs' })
        vim.keymap.set({ 'n' }, '<leader>ab', ":AnrcyBookmarkRun<cr>", { desc = 'anrcy: run bookmarked jobs' })
    end
}
