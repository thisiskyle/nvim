
local M = {}

function M.get(c, opts)
    return {
        require("drab.groups.standard").get(c, opts)
    }
end


return M
