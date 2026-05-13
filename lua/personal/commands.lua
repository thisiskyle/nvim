
for _,value in ipairs({ "Git", "G" }) do
    vim.api.nvim_create_user_command(
        value,
        function(opts)
            require("personal.utils").open_scratchpad()
            vim.cmd("%!git " .. table.concat(opts.fargs, " "))
        end,
        { nargs = 1 }
    )

end

