
M = {}

function M.ColorMe(conf)
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
        M.TransparentBg()
    else
        vim.opt.background = bg
        M.SolidBg()
    end
end

function M.TransparentBg()
    vim.opt.background = "dark"
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.g.transparent = true
end

function M.SolidBg()
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.g.transparent = false
end


return M
