
local M = {}

--- starts at given id and finds and increments until it finds 
--- an available base + id for a buffer
---@param base string
---@param id number
---
local function find_buf_name(base, id)
    local name = base .. id

    if(vim.fn.bufexists(name) == 0) then
        return name
    else
        if(vim.fn.bufloaded(name) == 0) then
            return name
        end
    end

    return find_buf_name(base, id + 1)
end

--- Writes to a buffer
---@param bufn number
---@param data string[]
---
local function write(bufn, data)
    vim.api.nvim_buf_set_lines(bufn, 0, -1, false, data)
end

--- Creates a buffer
---@param name string
---
local function create(name)
    local n = name:gsub(" ", "_")
    vim.cmd(":new")
    vim.cmd(":file " .. find_buf_name(n .. "_", 1))
    vim.opt_local.buftype = "nofile"
    vim.opt_local.filetype = "json"
    vim.opt_local.swapfile = false
    return vim.api.nvim_get_current_buf()
end


--- Displays each Response in a new buffer
--- and runs the after() function if there is one
---@param responses Response[]
---
function M.show(responses)
    for _,v in pairs(responses) do
        local bufn = create(v.name)
        write(bufn, v.response)
        if(v.after) then
            v.after(v.response)
        end
    end
end

--- Displays TestResults in a new buffer
---@param results TestResults
---
function M.show_test_results(results)
    local bufn = create("test_results")
    write(bufn, results)
end

return M
