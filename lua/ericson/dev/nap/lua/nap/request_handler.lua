
---@class Job simplified job data used for creating the actual request job
---@field name string
---@field request HttpRequest
---@field command? string[]
---@field after? fun(data?: string[])
---@field test? fun(data?: string[])

---@class Response
---@field name? string
---@field response? string[]
---@field after? fun(data?: string[])
---@field test? fun(data?: string[])

---@class TestResults: string[]


local ui = require("nap.ui")
local curl = require("nap.curl")
local running = {}
local complete = {}

local M = {}

--- Get the progress counts and pass it along to the UI
local function show_progress()
    if(next(running) == nil) then
        ui.show_progress(1, 1)
        return
    end

    local run = 0
    local done = 0

    for _,_ in pairs(running) do
        run = run + 1
    end
    for _,_ in pairs(complete) do
        done = done + 1
    end

    ui.show_progress(run + done, done)
    vim.defer_fn(show_progress, 100)
end


--- Run the tests (if provided) on the data in the Response
---@param responses Response[]
---@return TestResults
---
function M.run_tests(responses)
    local results = {}
    for _,res in pairs(responses) do
        if(res.test) then
            local r = "fail"
            local n = res.name or "nap"
            if(res.test(res.response) == true) then
                r = "pass"
            end
            table.insert(results, r .. ": " .. n)
        end
    end
    return results
end



--- Uses vim.fn.system and curl to make a syncronous http request. Blocking
---@param jobs Job[]
---@return Response[]
---
function M.sync(jobs)
    local responses = {}

    for _,j in ipairs(jobs) do

        local cmd = j.command or curl.build_curl_command(j.request)

        if(cmd == "" or cmd == nil) then
            vim.notify("Job command was empty", vim.log.levels.ERROR)
            break
        end

        table.insert(responses, {
            name = j.name or "nap",
            response = { vim.fn.system(cmd) },
            after = j.after or nil,
            test = j.test or nil
        })

    end
    return responses
end


--- Uses vim.fn.jobstart and curl to make an asyncronous http request. Non-blocking
---@param jobs Job[]
---@param on_complete fun(data?: Response[]) on_complete callback handler
---
function M.async(jobs, on_complete)

    for _,j in ipairs(jobs) do

        local cmd = j.command or curl.build_curl_command(j.request)

        if(cmd == "" or cmd == nil) then
            vim.notify("Job command was empty", vim.log.levels.ERROR)
            break
        end

        local job_id = vim.fn.jobstart(
            cmd,
            {
                stdout_buffered = true,
                stderr_buffered = true,

                on_stdout = function(id, data, _)
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

        -- add the job to the running buffer
        running[job_id] = {
            name = j.name or "nap",
            response = nil,
            after = j.after or nil,
            test = j.test or nil
        }


    end
    show_progress()
end

return M
