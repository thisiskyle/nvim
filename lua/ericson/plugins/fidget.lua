return {
    {
        'j-hui/fidget.nvim',
        lazy = false,
        config = function()

            require('fidget').setup({
                notification = {
                    override_vim_notify = true
                }
            })

        end
    }
}
