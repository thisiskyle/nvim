
M = {}

local request_types = {
    get = { "-X", "GET", "--get" },
    GET = { "-X", "GET", "--get" },
    POST = { "-X", "POST" },
    post = { "-X", "POST" },
}

-- build the command string from a table
function M.build(request)

    local _request = {}
    table.insert(_request, "curl")
    table.insert(_request, "-s")

    if(request.curl_extras) then
        for _,v in ipairs(request.curl_extras) do
            table.insert(_request, v)
        end
    end

    for _,v in ipairs(request_types[request.type]) do
        table.insert(_request, v)
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
