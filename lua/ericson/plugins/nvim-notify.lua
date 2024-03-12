
return {
    {
        'rcarriga/nvim-notify',
        lazy = false,
        config = function()
            local notify = require("notify")
            vim.notify = notify.notify

            notify.setup({
                background_colour = "#000000",
                --icons = {
                --    DEBUG = "D",
                --    ERROR = "E",
                --    INFO = "I",
                --    TRACE = "T",
                --    WARN = "W"
                --},
                stages = "static",
                render = "wrapped-compact",
                top_down = false,
                max_width = 50,
            })
        end
    },
}
