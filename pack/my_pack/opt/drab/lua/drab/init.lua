
local M = {}


function M.load(variant, options)
    vim.cmd([[ hi clear ]])
    vim.g.colors_name = variant

    local colors = require("drab.colors." .. variant)
    local groups = require("drab.groups").get(colors, options)

    for _,v in pairs(groups) do
        for k2,v2 in pairs(v) do
            vim.api.nvim_set_hl(0, k2, v2)
        end
    end

end


function M.setup(options)

    M.load("main", options)

end

return M
