-- config

local M = {
    -- path to the save file
    save_file = vim.fn.stdpath("data") .. "/.vibecheck",
    -- "default" "previous" "random"
    startup = "default",
    -- the default vibe to use with startup = "default"
    default = "",
    -- table of colorscheme configs (vibes)
    vibes = {},
}


--- Merges the default config with a config provided by the user
--- @param _config any
function M.setup(_config)
    for k,v in pairs(_config) do
        M[k] = v
    end

end

return M
