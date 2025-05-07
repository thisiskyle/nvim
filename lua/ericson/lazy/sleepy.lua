return {
    {
        dir = vim.fn.stdpath("config") .. "/lua/ericson/dev/sleepy",
        enabled = true,
        lazy = false,
        priority = 50,
        config = function()
            require("sleepy")
        end
    }
}
