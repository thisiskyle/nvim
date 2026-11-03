local _pack_id = (debug.getinfo(1, "S").source):match("([^@/\\]+)%.lua$")

vim.pack.add({
    {
        src = "https://github.com/tjdevries/present.nvim",
        name = "present",
        data = { pack_id = _pack_id }
    }
}, { confirm = false })

