
require("vibecheck.commands")

local M = {}
M.config = require("vibecheck.config")



--- Takes a vibe table and applys the theme accordingly
--- @param _vibe table
---
local function apply_vibe(_vibe)
    if(_vibe.config) then
        _vibe.config()
    end

    vim.opt.background = _vibe.background
    vim.cmd.colorscheme(_vibe.colorscheme)

    if(_vibe.after) then
        _vibe.after()
    end

    if(_vibe.force_transparent) then
        vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = 'none' })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
    end
end

--- Returns a string of the last used vibe.
--- If none is found, we try the default in the config.
--- If no default is set, we simply use neovim's default.
--- @param _config table
--- @return string
---
local function get_last(_config)
    local f = io.open(_config.save_file, "r")
    local to_return = "default"

    if(f ~= nil) then
        to_return = f:read()
        f:close()
    else
        if(_config.default ~= "") then
            to_return = _config.default
        end
    end

    return to_return
end

--- Saves a string to a file
--- @param name string
--- @param save_file string
---
local function save(name, save_file)
    local f = assert(io.open(save_file, "w"))

    if(f == nil) then
        print("Failed to save: " .. save_file .. " not found")
        return
    end
    f:write(name)
    f:close()
end


--- Picks a random vibe from the table
--- @param _vibes table
--- @return string
---
local function pick_random(_vibes)
    local ret = ""

    -- count number of vibes
    local n = 0
    for _ in pairs(_vibes) do
        n = n + 1
    end

    -- generate random number
    math.randomseed(os.time())
    local rand = math.random(1,n)

    -- find the key for the number and set theme
    n = 0
    for k in pairs(_vibes) do
        if(n == rand) then
            ret = _vibes[k]
            break
        end
        n = n + 1
    end

    return ret
end

--- Uses the given string to apply the vibe.
--- Once applied, it will also save the name to 
--- config.save_file
--- @param name string
---
function M.vibe_check(name)

    if(M.config.vibes[name] == nil) then
        print("Vibe " .. name .. "does not exist")
        vim.cmd.colorscheme("default")
        return
    end

    apply_vibe(M.config.vibes[name])

    if(M.config.save_file ~= "") then
        save(name, M.config.save_file)
    end

end



--- Calls the setup function on the config
--- and decides on the startup method to use
--- @param _config any
function M.setup(_config)
    M.config.setup(_config)

    local vibe = M.config.default

    if(M.config.startup == "last") then
        vibe = get_last(M.config)

    elseif(M.config.startup == "random") then
        vibe = pick_random(M.config.vibes)

    end

    M.vibe_check(vibe)
end

return M
