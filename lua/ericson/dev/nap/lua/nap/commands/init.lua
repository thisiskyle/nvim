vim.api.nvim_create_user_command(
    'Nap',
    function()
        require("nap").use_selection()
    end,
    {
        range = true
    }
)

vim.api.nvim_create_user_command(
    'NapAnimate',
    function()
        require("nap.ui").test_animations(500)
    end,
    {}
)
