return {
    {
        "thisiskyle/sleepy-nvim",
        enabled = true,
        lazy = false,
        priority = 50,
        opts = {
            global_after = function()
                vim.cmd(":%!jq")
            end,
        },
        keys = {

            {
                '<leader>nn',
                mode = 'v',
                desc = 'sleepy: run',
                ":Sleepy<cr>",
            }
        },
    }
}
