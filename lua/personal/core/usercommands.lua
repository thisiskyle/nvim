vim.api.nvim_create_user_command(
    'Git',
    function(opts)
        require("personal.utils").open_scratchpad()
        vim.cmd("%!git " .. table.concat(opts.fargs, " "))
    end,
    { nargs = 1 }
)

vim.api.nvim_create_user_command(
    'G',
    function(opts)
        require("personal.utils").open_scratchpad()
        vim.cmd("%!git " .. table.concat(opts.fargs, " "))
    end,
    { nargs = 1 }
)

