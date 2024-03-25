return {
    {
        'j-hui/fidget.nvim',
        lazy = false,
        config = function()
            local fidget = require("fidget")
            fidget.setup()
            vim.notify = fidget.notify
        end
    },
}
