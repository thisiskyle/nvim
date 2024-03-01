
local M = {}

local configDir = ""

if(vim.loop.os_uname().sysname == "Linux") then
    configDir = os.getenv("HOME") .. "/.config/nvim/"
elseif(vim.loop.os_uname().sysname == "Windows") then
    configDir = os.getenv("userprofile") .. "/AppData/Local/nvim/"
end

local config = {
    save_file = configDir .. "/.vibecheck",
    default = "",
    use_last = true,
    vibes = {},
}

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
        print("failed to save: file not found")
        return
    end
    f:write(name)
    f:close()
end

function M.setup(_config)

    -- merge the tables
    for k,v in pairs(_config) do
        config[k] = v
    end

    if(config.use_last) then
        use_last()
    else
        apply_theme(config.vibes[config.default])
    end
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

return M
