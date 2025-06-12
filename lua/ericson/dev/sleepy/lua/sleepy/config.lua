
---@class Config
---@field animation string
---@field custom_animations table
---
local default = {
    animation = "sleep"
}


local M = {}

M.config = default

--- Returns the default config settings
---@return table
---
function M.get_default()
    return default
end


--- Merge custom config with default config
---@param opts Config -- custom config
---
function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", default, opts or {})

    local animator = require("sleepy.ui.animator")

    -- add any custom animations to the animations list
    for key, value in pairs(M.config.custom_animations) do
        animator.animations[key] = value
    end
end

return M
