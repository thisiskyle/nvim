
local M = {}

local vibes = {}

local function set_transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
end


local function apply_theme(_theme)
    if _theme.config then
        _theme.config()
    end

    vim.opt.background = _theme.background
    vim.cmd.colorscheme(_theme.colorscheme)

    if _theme.post then
        _theme.post()
    end

    if(_theme.transparent) then
        set_transparent()
    end
end

function M.setup(_vibes)
    vibes = _vibes
end

--- Sets the theme to the provided name
---@param name any
function M.set_the_mood(name)
    apply_theme(vibes[name])
end

function M.pick_random()
    -- count number of vibes
    local n = 0
    for _ in pairs(vibes) do
        n = n + 1
    end

    -- generate random number
    math.randomseed(os.time())
    local rand = math.random(1,n)

    -- find the key for the number and set theme
    n = 0
    for k in pairs(vibes) do
        if(n == rand) then
            apply_theme(vibes[k])
        end
        n = n + 1
    end
end

return M
