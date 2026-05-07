local _pack_id = require("personal.utils").get_file_name(debug.getinfo(1, "S").source)

vim.pack.add({
    {
        src = "https://github.com/thisiskyle/anrcy.nvim",
        data = { pack_id = _pack_id }
    }
}, { confirm = false })

-- vim.cmd.packadd("anrcy-dev")

require("anrcy").setup({
    global_after = function(payload)
        local out = vim.fn.system({ "jq", "." }, table.concat(payload))
        return vim.split(out, "\n", { plain = true })
    end,
})

vim.keymap.set({ 'x' }, '<leader>aa', function() require("anrcy").run_highlighted_jobs() end, { desc = 'anrcy: run highlighted jobs' })
vim.keymap.set({ 'x' }, '<leader>ag', function() require("anrcy").get_highlighted_url() end, { desc = 'anrcy: basic get request for highlighted url' })
vim.keymap.set({ 'x' }, '<leader>ac', function() require("anrcy").show_curl() end, { desc = 'anrcy: show curl commands' })
vim.keymap.set({ 'x' }, '<leader>ab', function() require("anrcy").set_bookmark() end, { desc = 'anrcy: bookmark selected jobs' })
vim.keymap.set({ 'n' }, '<leader>ab', function() require("anrcy").execute_bookmark() end, { desc = 'anrcy: execute bookmarked jobs' })
vim.keymap.set({ 'n' }, '<leader>ah', function() require("anrcy").show_history() end, { desc = 'anrcy: show job history' })
vim.keymap.set({ 'n' }, '<leader>at', function() require("anrcy").insert_template() end, { desc = 'anrcy: insert job template' })
vim.keymap.set({ 'n' }, '<leader>ar', function() require("anrcy").repeat_last() end, { desc = 'anrcy: repeat last' })
