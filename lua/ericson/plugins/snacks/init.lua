vim.api.nvim_create_autocmd("LspProgress", {
  callback = function(ev)
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(vim.lsp.status(), "info", {
      id = "lsp_progress",
      title = "LSP Progress",
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == "end" and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})


return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        zen = require("ericson.plugins.snacks.zen"),
        notifier = require("ericson.plugins.snacks.notifier"),
        picker = require("ericson.plugins.snacks.picker"),
        dim = { enabled = true },
        scopes = { enabled = true }
    },
    keys = {
        { '<leader>z', function() Snacks.zen() end, mode = 'n'},

        { '<leader>nh', function() Snacks.notifier.show_history() end, mode = 'n'},

        { '<leader>ff', function() Snacks.picker.files() end, mode = 'n'},
        { '<leader>fg', function() Snacks.picker.grep() end, mode = 'n'},
        { '<leader>fw', function() Snacks.picker.grep_word() end, mode = 'n'},
        { '<leader>fh', function() Snacks.picker.help() end, mode = 'n'},
        { '<leader>fd', function() Snacks.picker.lsp_definitions() end, mode = 'n'},
        { '<leader>fr', function() Snacks.picker.lsp_references() end, mode = 'n'},
        { '<leader>fi', function() Snacks.picker.lsp_implementations() end, mode = 'n'},
        { '<leader>fs', function() Snacks.picker.lsp_symbols() end, mode = 'n'},
    }
}
