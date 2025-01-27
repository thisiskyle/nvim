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
        --notifier = require("ericson.plugins.snacks.notifier"),
    },
    keys = {
        { '<leader>z', function() Snacks.zen() end, mode = 'n'},
    }
}
