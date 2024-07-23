
local M = {}

local config = {
    save_file = vim.fn.stdpath("data") .. "/.vibecheck",
    default = "",
    startup = "default",
    vibes = {},
}

local function set_transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
end

local function apply_theme(_theme)
    if(_theme.config) then
        _theme.config()
    end

    vim.opt.background = _theme.background
    vim.cmd.colorscheme(_theme.colorscheme)

    if(_theme.after) then
        _theme.after()
    end

    if(_theme.transparent) then
        set_transparent()
    end
end

local function use_last()
    local f = io.open(config.save_file, "r")
    if(f == nil) then
        if(config.default == "") then
            M.pick_random()
        else
            apply_theme(config.vibes[config.default])
        end
    else
        apply_theme(config.vibes[f:read()])
        f:close()
    end
end

local function save(name)
    local f = assert(io.open(config.save_file, "w"))

    if(f == nil) then
        print("Failed to save: " .. config.save_file .. " not found")
        return
    end
    f:write(name)
    f:close()
end

--- Sets the theme to the provided name
---@param name any
function M.set_the_mood(name)
    apply_theme(config.vibes[name])
    if(config.save_file ~= "") then
        save(name)
    end
end


function M.pick_random()
    -- count number of vibes
    local n = 0
    for _ in pairs(config.vibes) do
        n = n + 1
    end
    -- generate random number
    math.randomseed(os.time())
    local rand = math.random(1,n)
    -- find the key for the number and set theme
    n = 0
    for k in pairs(config.vibes) do
        if(n == rand) then
            apply_theme(config.vibes[k])
        end
        n = n + 1
    end
end


function M.setup(_config)
    -- merge the tables
    for k,v in pairs(_config) do
        config[k] = v
    end

    if(config.startup == "previous") then
        use_last()
    elseif(config.startup == "random") then
        M.pick_random()
    else
        apply_theme(config.vibes[config.default])
    end
end

return M
