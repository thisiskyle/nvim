return {
    enabled = true,
    timeout = 3000,
    width = { min = 40, max = 0.4 },
    height = { min = 1, max = 0.6 },
    margin = { top = 0, right = 1, bottom = 0 },
    padding = true,
    sort = { "level", "added" },
    level = vim.log.levels.TRACE,
    icons = {
        error = "[Error]",
        warn = "[Warn]",
        info = "[Info]",
        debug = "[Debug]",
        trace = "[Trace]",
    },
    keep = function(notif)
        return vim.fn.getcmdpos() > 0
    end,
    style = "compact",
    top_down = false,
    date_format = "%R",
    more_format = " ↓ %d lines ",
    refresh = 50,
}
