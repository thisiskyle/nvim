M = {}

-- starts at given id and finds and increments until it finds
-- an available base + id for a buffer
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

local function write(bufn, data)
    vim.api.nvim_buf_set_lines(bufn, 0, -1, false, data)
end

local function create(name)
    local n = name:gsub(" ", "_")
    vim.cmd(":new")
    vim.cmd(":file " .. find_buf_name(n .. "_", 1))
    vim.opt_local.buftype = "nofile"
    vim.opt_local.filetype = "json"
    vim.opt_local.swapfile = false
    return vim.api.nvim_get_current_buf()
end


function M.display_response(response)
    local bufn = create(response.name)
    write(bufn, response.response)
end


function M.display_test_results(results)
    local bufn = create('nap_test')
    write(bufn, results)
end

return M
