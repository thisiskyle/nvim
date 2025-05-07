
M = {}

local function make_bg_transparent()
    vim.opt.background = "dark"
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.g.transparent = true
end

local function make_bg_solid()
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.g.transparent = false
end

function M.transparent_bg()
    make_bg_transparent()
end

function M.solid_bg()
    make_bg_solid()
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
        make_bg_transparent()
    else
        vim.opt.background = bg
        make_bg_solid()
    end
end

return M
