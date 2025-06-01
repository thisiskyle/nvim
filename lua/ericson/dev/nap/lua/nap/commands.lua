vim.api.nvim_create_user_command(
    'Nap',
    function()
        require("nap").request_and_show()
    end,
    {
        range = true
    }
)

vim.api.nvim_create_user_command(
    'NapTest',
    function()
        require("nap").test_and_show()
    end,
    {
        range = true
    }
)

vim.api.nvim_create_user_command(
    'NapAnimate',
    function()
        require("nap.ui").test_animations()
    end,
    {}
)
