vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    group = vim.api.nvim_create_augroup("personal", { clear = true }),
    pattern = { "*" },
    callback = function()
        if(vim.g.transparent_bg) then
            vim.opt.background = "dark"
            vim.cmd.colorscheme(vim.g.colors_name)
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        end
    end,
})
