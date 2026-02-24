-- run a git command and show the output in a scratch buffer
vim.api.nvim_create_user_command(
    'Git',
    function(opts)
        require("personal.utils").git_run(opts)
    end,
    { nargs = 1 }
)

-- run a git command and show the output in a scratch buffer
vim.api.nvim_create_user_command(
    'G',
    function(opts)
        require("personal.utils").git_run(opts)
    end,
    { nargs = 1 }
)

