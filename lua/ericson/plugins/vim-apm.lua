return {
    {
        'ThePrimeagen/vim-apm',
        config = function()
            local apm = require("vim-apm")
            apm:setup({})
            apm:toggle_monitor()
        end
    }
}
