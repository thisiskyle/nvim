---@class BodyData
---@field url_encoded boolean
---@field data string

---@class RequestBody: BodyData[]

---@class HttpRequest table with the data needed to make an http request
---@field type string
---@field url string
---@field headers? string[]
---@field query? string[]
---@field additional_args? string[]
---@field body? RequestBody



M = {}

local request_types = {
    get = { "-X", "GET", "--get" },
    post = { "-X", "POST" },
}

--- Build the curl command string from a HttpRequest
---@param request HttpRequest
---@return string[]
---
function M.build_curl_command(request)

    local curl_command = {}
    local type = string.lower(request.type)

    table.insert(curl_command, "curl")
    table.insert(curl_command, "-s")

    if(request.additional_args) then
        for _,v in ipairs(request.additional_args) do
            table.insert(curl_command, v)
        end
    end

    for _,v in ipairs(request_types[type]) do
        table.insert(curl_command, v)
    end

    if(request.headers ~= nil) then
        for _,v in ipairs(request.headers) do
            table.insert(curl_command, "-H")
            table.insert(curl_command, v)
        end
    end

    if(request.body) then
        for _,v in ipairs(request.body) do
            if(v.encode or type == "get") then
                table.insert(curl_command, "--data-urlencode")
            else
                table.insert(curl_command, "--data")
            end
            table.insert(curl_command, v.data)
        end
    end

    table.insert(curl_command, request.url)

    return curl_command
end

return M
