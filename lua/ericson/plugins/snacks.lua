vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
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
        zen = { enabled = true },
        notifier = {
            {
                enabled = true,
                timeout = 3000, -- default timeout in ms
                width = { min = 40, max = 0.4 },
                height = { min = 1, max = 0.6 },
                -- editor margin to keep free. tabline and statusline are taken into account automatically
                margin = { top = 0, right = 1, bottom = 0 },
                padding = true, -- add 1 cell of left/right padding to the notification window
                sort = { "level", "added" }, -- sort by level and time
                -- minimum log level to display. TRACE is the lowest
                -- all notifications are stored in history
                level = vim.log.levels.TRACE,
                icons = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    debug = " ",
                    trace = " ",
                },
                keep = function(notif)
                    return vim.fn.getcmdpos() > 0
                end,
                style = "compact",
                top_down = true, -- place notifications from top to bottom
                date_format = "%R", -- time format for notifications
                -- format for footer when more lines are available
                -- `%d` is replaced with the number of lines.
                -- only works for styles with a border
                more_format = " ↓ %d lines ",
                refresh = 50, -- refresh at most every 50ms
            }
        }
    },
    keys = {
        { '<leader>z', function() Snacks.zen() end, mode = 'n'},
    }
}
