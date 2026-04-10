local _opts = {
    global_after = function(payload)
        local out = vim.fn.system({ "jq", "." }, table.concat(payload))
        return vim.split(out, "\n", { plain = true })
    end,
}

return {
    enabled = true,
    specs = {
        {
            src = "https://github.com/thisiskyle/anrcy.nvim",
            data = _opts
        }
    },
    setup = function()
        require("anrcy").setup(_opts)

        vim.keymap.set({ 'v' }, '<leader>aa', function() require("anrcy").run_highlighted_jobs() end, { desc = 'anrcy: run highlighted jobs' })
        vim.keymap.set({ 'v' }, '<leader>ag', function() require("anrcy").get_highlighted_url() end, { desc = 'anrcy: basic get request for highlighted url' })
        vim.keymap.set({ 'v' }, '<leader>ac', function() require("anrcy").show_curl() end, { desc = 'anrcy: show curl commands' })
        vim.keymap.set({ 'v' }, '<leader>ab', function() require("anrcy").set_bookmark() end, { desc = 'anrcy: bookmark selected jobs' })

        vim.keymap.set({ 'n' }, '<leader>ab', function() require("anrcy").execute_bookmark() end, { desc = 'anrcy: execute bookmarked jobs' })
        vim.keymap.set({ 'n' }, '<leader>ah', function() require("anrcy").show_history() end, { desc = 'anrcy: show job history' })
        vim.keymap.set({ 'n' }, '<leader>at', function() require("anrcy").insert_template() end, { desc = 'anrcy: insert job template' })
        vim.keymap.set({ 'n' }, '<leader>ar', function() require("anrcy").repeat_last() end, { desc = 'anrcy: repeat last' })
    end
}
