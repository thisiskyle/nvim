if (true) then

    local _pack_id = (debug.getinfo(1, "S").source):match("([^@/\\]+)%.lua$")

    vim.pack.add({
        {
            src = "https://github.com/nvzone/typr",
            name = "typr",
            data = { pack_id = _pack_id }
        },
        {
            src = "https://github.com/nvzone/volt",
            name = "volt",
            data = { pack_id = _pack_id }
        }
    }, { confirm = false })

end
