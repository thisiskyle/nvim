return {
    {
        'rcarriga/nvim-notify',
        config = function()
            local n = require("notify")
            n.setup({
                background_colour = "#000000",
                fps = 30,
                icons = {
                    DEBUG = "D",
                    ERROR = "E",
                    INFO = "I",
                    TRACE = "T",
                    WARN = "W"
                },
                level = 2,
                minimum_width = 50,
                render = "compact",
                stages = "fade",
                time_formats = {
                    notification = "%T",
                    notification_history = "%FT%T"
                },
                timeout = 2000,
                top_down = true
            })
            vim.notify = n
            vim.rpcnotify = n
            vim.lsp.rpc.notify = n
        end
    }
}
