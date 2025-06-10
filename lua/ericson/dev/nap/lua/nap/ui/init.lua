
local M = {}



--- Formats the test results into a string[] for buffer insertion
---@param results table
---@return string[]
---
local function format_test_results(results)
    local content = {}
    for _,v in pairs(results) do
        table.insert(content, "Test: " .. v.name .. " [" .. tostring(v.result) .. "]")
    end
    table.insert(content, "")
    table.insert(content, "-----------------------------------------------")
    table.insert(content, "")
    return content
end



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



--- Writes data to a buffer
---@param bufn number
---@param data string[]
---
local function write(bufn, data)
    vim.api.nvim_buf_set_lines(bufn, 0, -1, false, data)
end



--- Insert at top of buffer
---@param bufn number
---@param data string[]
---
local function insert_at_top(bufn, data)
    vim.api.nvim_buf_set_lines(bufn, 0, 0, false, data)
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
    for _,r in pairs(responses) do
        local bufn = create(r.name)
        write(bufn, r.data)
        if(r.after) then
            r.after(r.data)
        end

        if(r.test_results) then
            insert_at_top(bufn, format_test_results(r.test_results))
        end
    end
end


--- Diplays a notification of the current job progress
---@param target number
---@param completed number
---@param anim? Animation
---
function M.show_progress(target, completed, anim)
    local animator = require("nap.ui.animator")
    local spinner = ""
    local message = "Done!"

    if(not (completed == target)) then
        spinner = animator.get_frame(anim)
        message = "Completed Requests: " .. completed .. "/" .. target
    end

    vim.notify(message, "info", {
        id = "nap_progress",
        title = "NAP Progress",
        opts = function(notif)
            notif.icon = spinner
        end
    })

end



--- Creates a dummy notification that displays all the animations
--- this probably only works because I am using snacks notifier
function M.test_animations(count)
    if(count <= 0) then
        return
    end

    local animator = require("nap.ui.animator")
    local message = ""

    for k,v in pairs(animator.animations) do
        message = message .. k .. ": " .. animator.get_frame(v) .. "\n"
    end

    vim.notify(message, "info", {
        id = "nap_progress",
        title = "NAP Progress",
    })

    count = count - 1

    vim.defer_fn(function() M.test_animations(count) end, 50)
end

return M
