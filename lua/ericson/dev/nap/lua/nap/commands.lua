vim.api.nvim_create_user_command(
    'Nap',
    function()
        require("nap").display()
    end,
    {
        range = true
    }
)

vim.api.nvim_create_user_command(
    'NapTest',
    function()
        -- todo: do something other than display here
        require("nap").test()
    end,
    {
        range = true
    }
)
