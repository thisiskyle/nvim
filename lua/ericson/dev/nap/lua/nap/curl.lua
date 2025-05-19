
M = {}

local function add_headers(headers)
    if(headers == nil) then
        return ""
    end

    local h = ""
    for _,v in ipairs(headers) do
        h = h .. '-H "' .. v .. '" '
    end
    return h
end

local function add_request_type(type)
    if(type == nil) then
        return ""
    end

    local types = {
        get = "--get ",
        GET = "--get ",
        POST = "-X POST ",
        post = "-X POST ",
    }

    local t = types[type]

    if(t == nil) then
        t = ""
    end

    return t
end

local function add_user(user)
    if(user) then
        return '-u "' .. user .. '" '
    else
        return ""
    end
end

local function add_body(body)
    if(body == nil) then
        return ""
    end
    return '-d "' .. body .. '" '
end

local function add_params(params)
    if(params == nil) then
        return ""
    end
    local p = ""

    for _,v in ipairs(params) do
        p = p .. '--data-urlencode "' .. v .. '" '
    end

    return p
end

-- build the command string from a table
function M.build(data)

    local t = add_request_type(data.request.type)

    -- type is required
    if(t == nil) then
        vim.notify("request type is not set")
        return ""
    end

    -- url is required
    if(data.request.url == nil) then
        vim.notify("request url is not set")
        return ""
    end

    return "curl -s --ssl-no-revoke "
        .. t
        .. add_user(data.request.user)
        .. add_headers(data.request.headers)
        .. add_body(data.request.body)
        .. add_params(data.request.params)
        .. '"' .. data.request.url .. '"'
end


return M
