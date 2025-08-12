local M = {}

function M.transparent_bg()
    vim.opt.background = "dark"
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.g.transparent = true
end

function M.solid_bg()
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.g.transparent = false
end

function M.color_me(conf)
    local c = conf.color or "habamax"
    local t = conf.transparent or false

    vim.cmd.colorscheme(c)

    if(t) then
        M.transparent_bg()
    else
        M.solid_bg()
    end

end

return M
