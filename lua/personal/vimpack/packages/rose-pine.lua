local _pack_id = require("personal.utils").get_file_name(debug.getinfo(1, "S").source)

vim.pack.add({
    {
        src = "https://github.com/rose-pine/neovim",
        name = "rose-pine",
        data = { pack_id = _pack_id }
    }
}, { confirm = false })



require("rose-pine").setup({
    variant = "moon",
    enable = {
        terminal = true
    },
    dim_inactive_windows = false,
    styles = {
        bold = false,
        italic = false,
        transparency = false,
    },
    highlight_groups = {
        Comment = {
            italic = true
        }
    }
})
