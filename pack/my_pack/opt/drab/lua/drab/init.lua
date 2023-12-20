local highlights = require("drab.highlights")
local palettes = require("drab.palettes")

local M = {}


-- highlight function
local function color_the_things(theme)
    for key,value in pairs(theme) do
        for key2, value2 in pairs(value.groups) do

            if(value.style.link ~= nil) then
                -- we want link to override everything else, so we ignore the rest of the style 
                -- and only set 'link'
                vim.api.nvim_set_hl(0, value.groups[key2], { link = value.style.link })
                -- jump to end of loop, skipping everything else
                goto continue
            end

            local style = {
                fg      = (value.style.fg == nil and {'NONE'} or {value.style.fg.gui})[1],
                bg      = (value.style.bg == nil and {'NONE'} or {value.style.bg.gui})[1],
                ctermfg = (value.style.fg == nil and {'NONE'} or {value.style.fg.term})[1],
                ctermbg = (value.style.bg == nil and {'NONE'} or {value.style.bg.term})[1],
            }

            if(value.style.attributes ~= nil) then
                for k,v in pairs(value.style.attributes) do
                    style[k] = v
                end
            end

            vim.api.nvim_set_hl(0, value.groups[key2], style)

            ::continue::
        end
    end
end


function M.load(style)
    vim.cmd([[ hi clear ]])
    vim.g.colors_name = style
    color_the_things(highlights.setup(palettes.list[style]))
end

return M
