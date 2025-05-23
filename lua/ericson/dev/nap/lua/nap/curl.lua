
M = {}

local function add_headers(headers)
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
    return "-d '" .. body .. "' "
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
function M.build(request)

    local _request = {}
    table.insert(_request, "curl")
    table.insert(_request, "-s")
    table.insert(_request, "-X")
    table.insert(_request, request.type)

    if(request.type == "GET") then
        table.insert(_request, "--get")
    end

    if(request.headers ~= nil) then
        for _,v in ipairs(request.headers) do
            table.insert(_request, "-H")
            table.insert(_request, v)
        end
    end

    if(request.body) then
        table.insert(_request, "-d")
        table.insert(_request, request.body)
    end

    if(request.params) then
        for _,v in ipairs(request.params) do
            table.insert(_request, "--data-urlencode")
            table.insert(_request, v)
        end
    end

    table.insert(_request, request.url)

    return _request
end


return M
