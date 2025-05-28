
---@class Response
---@field name? string
---@field response? string[]
---@field after? fun(data?: string[])
---@field test? fun(data?: string[])

---@class Request data needed to make an http request
---@field type string
---@field url string
---@field curl_extras? string[]
---@field body? string

---@class RequestJob simplified job data used for creating the actual request job
---@field name string
---@field request Request
---@field after? fun(data?: string[])
---@field test? fun(data?: string[])

---@class CurlJob the request job that contains the curl command that will be used
---@field name string
---@field cmd string[] the curl command
---@field after? fun(data?: string[])
---@field test? fun(data?: string[])

---@class TestResults: string[]

local curl = require("nap.curl")
local running = {}
local complete = {}

local M = {}

--- Convert a array of RequestJob into an array of RequestJobs
--- with a curl command
---@param data RequestJob[]
---@return CurlJob[]
---
local function build_curl_jobs(data)
    local jobs = {}
    for _, v in ipairs(data) do
        table.insert(jobs, {
            name = v.name or "nap",
            cmd = curl.build(v.request),
            after = v.after or nil,
            test = v.test or nil
        })

    end
    return jobs
end


--- Run the tests (if provided) on the data in the Response
---@param responses Response[]
---@return TestResults
---
function M.run_tests(responses)
    local results = {}
    for _,job in pairs(responses) do
        if(job.test) then
            local r = "fail"
            local n = job.name or "nap"
            if(job.test(job.response) == true) then
                r = "pass"
            end
            table.insert(results, r .. ": " .. n)
        end
    end
    return results
end



--- Uses vim.fn.system and curl to make a syncronous http request. Blocking
---@param requestJobs RequestJob[]
---@return Response[]
---
function M.sync(requestJobs)
    local jobs = build_curl_jobs(requestJobs)
    local responses = {}
    for _,j in ipairs(jobs) do

        if(j.cmd == "" or j.cmd == nil) then
            vim.notify("Job command was empty", vim.log.levels.ERROR)
            break
        end
        table.insert(responses, {
            name = j.name or "nap",
            response = { vim.fn.system(j.cmd) },
            after = j.after or nil,
            test = j.test or nil
        })

    end
    return responses
end


--- Uses vim.fn.jobstart and curl to make an asyncronous http request. Non-blocking
---@param requestJobs RequestJob[]
---@param on_complete fun(data?: Response[]) on_complete callback handler
---
function M.async(requestJobs, on_complete)
    local jobs = build_curl_jobs(requestJobs)

    for _,j in ipairs(jobs) do

        if(j.cmd == "" or j.cmd == nil) then
            vim.notify("Job command was empty", vim.log.levels.ERROR)
            break
        end

        local job_id = vim.fn.jobstart(
            j.cmd,
            {
                stdout_buffered = true,
                stderr_buffered = true,

                on_stdout = function(id, data, _)
                    -- add the response to the related job
                    running[id].response = data
                end,

                on_stderr = function (id, data, _)
                    if(next(data) ~= nil and data[1] ~= "") then
                        -- overwrite the response with the error
                        running[id].response = data
                    end
                end,

                on_exit = function(id, _, _)
                    complete[id] = running[id]
                    running[id] = nil

                    if(next(running) == nil) then
                        on_complete(complete)
                        running = {}
                        complete = {}
                    end
                end,
            }
        )

        running[job_id] = {
            name = j.name or "nap",
            response = nil,
            after = j.after or nil,
            test = j.test or nil
        }

    end
end

return M
