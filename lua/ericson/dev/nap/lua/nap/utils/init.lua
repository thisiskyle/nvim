local M = {}

function M.get_visual_selection()
    local s_start = vim.fn.getpos("'<")
    local s_end = vim.fn.getpos("'>")
    local n_lines = math.abs(s_end[2] - s_start[2]) + 1
    local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
    lines[1] = string.sub(lines[1], s_start[3], -1)
    if n_lines == 1 then
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
    else
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
    end
    return table.concat(lines, '\n')
end

-- todo: unused
-- this isn't 100% accurate, but should work 
-- for out purposes
function M.is_array(t)
    if(t[1]) then
        return true
    end
    return false
end

-- todo: unused
-- Because we are using a visual selection as our input
-- we are going to try and be flexible here. By default we wrap the 
-- selected text in an array, but incase the user has already selected
-- an array, we are going to dig into the table and try to correctly
-- extract the valid array
function M.validate(t)
    if(M.is_array(t) == true) then
        if(M.is_array(t[1]) == true) then
            return t[1]
        else
            return t
        end
    else
        return { t }
    end
end


-- todo: instead of using load here, we should put the string in a file
--       then use require to get the tables from it
function M.get_visual_selection_as_lua()
    local selected = M.get_visual_selection()
    local path = vim.fn.stdpath("cache") .. "/tmp.lua"
    local file = io.open(path, "w")

    if(file) then
        file:write("return {\n" .. selected .. "\n}")
        file:close()
    end

    local data = dofile(path)

    return data
end

return M
