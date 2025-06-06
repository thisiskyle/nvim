vim.api.nvim_create_user_command(
    'Nap',
    function()
        require("nap").request_using_selection()
    end,
    {
        range = true
    }
)

vim.api.nvim_create_user_command(
    'NapTest',
    function()
        require("nap").test_using_selection()
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
