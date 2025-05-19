return {
    {
        dir = vim.fn.stdpath("config") .. "/lua/ericson/dev/nap",
        enabled = true,
        lazy = false,
        priority = 50,
        config = function()
            require("nap")
        end
    }
}
