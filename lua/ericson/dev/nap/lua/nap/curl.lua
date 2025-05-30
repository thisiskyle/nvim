

---@class HttpRequest table with the data needed to make an http request
---@field type string
---@field url string
---@field headers? string[]
---@field params? string[]
---@field curl_extras? string[]
---@field body? string


M = {}

local request_types = {
    get = { "-X", "GET", "--get" },
    GET = { "-X", "GET", "--get" },
    POST = { "-X", "POST" },
    post = { "-X", "POST" },
}

--- Build the curl command string from a HttpRequest
---@param request HttpRequest
---@return string[]
---
function M.build_curl_command(request)

    local curl_command = {}
    table.insert(curl_command, "curl")
    table.insert(curl_command, "-s")

    if(request.curl_extras) then
        for _,v in ipairs(request.curl_extras) do
            table.insert(curl_command, v)
        end
    end

    for _,v in ipairs(request_types[request.type]) do
        table.insert(curl_command, v)
    end

    if(request.headers ~= nil) then
        for _,v in ipairs(request.headers) do
            table.insert(curl_command, "-H")
            table.insert(curl_command, v)
        end
    end

    if(request.body) then
        table.insert(curl_command, "-d")
        table.insert(curl_command, request.body)
    end

    if(request.params) then
        for _,v in ipairs(request.params) do
            table.insert(curl_command, "--data-urlencode")
            table.insert(curl_command, v)
        end
    end

    table.insert(curl_command, request.url)

    return curl_command
end

return M
