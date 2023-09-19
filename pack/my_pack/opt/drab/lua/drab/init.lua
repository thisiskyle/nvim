local util = require("drab.util")
local theme = require("drab.highlights")
local colors = require("drab.colors")

local M = {}


function M.load(style)

    vim.cmd([[ hi clear ]])

    if(style == "night") then
        vim.g.colors_name = "drab-night"
        util.highlight(theme.setup(colors.night))
    else
        vim.g.colors_name = "drab"
        util.highlight(theme.setup(colors.default))
    end

end

return M
