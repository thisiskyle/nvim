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
    -- default
    local c = "habamax"
    local bg = "transparent"
    -- override bg with global var
    if(vim.g.transparent ~= nil and not vim.g.transparent) then
        bg = "dark"
    end
    -- override with conf
    if(conf) then
        c = conf.color or c
        bg = conf.bg or bg
    end
    -- set
    vim.cmd.colorscheme(c)
    if(bg == "transparent") then
        M.transparent_bg()
    else
        vim.opt.background = bg
        M.solid_bg()
    end
end

return M
