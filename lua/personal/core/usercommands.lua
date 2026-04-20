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


vim.api.nvim_create_user_command(
    'Pack',
    function(opts)
        local arg = opts.args

        if(arg == 'update') then
            vim.pack.update()

        elseif(arg == 'clean') then
            local vimpack = require("personal.utils.vimpack")
            vimpack.delete_all()
            vimpack.load()

        elseif(arg == 'purge') then
            require("personal.utils.vimpack").delete_all()

        else
            vim.notify(
                'Invalid command: Pack ' .. arg,
                vim.log.levels.ERROR
            )
        end
    end,
    {
        nargs = 1,
        complete = function(arglead)
            local cmds = { 'update', 'clean', 'purge' }
            return vim.tbl_filter(function(cmd)
                return cmd:find(arglead, 1, true) == 1
            end, cmds)
        end,
    }
)
