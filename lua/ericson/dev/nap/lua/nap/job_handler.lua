local buffer = require("nap.buffer")
local curl = require("nap.curl")

M = {}

local function display_response(output)
    for _,o in ipairs(output) do
        local bufn = buffer.create(o.name)
        buffer.write(bufn, o.data)
        if(o.after) then
            o.after(o.data)
        end
    end
end

local function display_test_results(results)
    local bufn = buffer.create('nap_test')
    buffer.write(bufn, results)
end


local function run_tests(tests)
    local results = {}

    for _,t in ipairs(tests) do
        if(t.test) then
            local tr = t.test(t.data)
            local n = t.name or "nap"
            local r = "fail"
            if(tr == true) then
                r = "pass"
            end
            table.insert(results, n .. ": " .. r)
        end
    end
    return results
end

local function build(data)
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

local function sync_run(jobData)
    local jobs = build(jobData)
    local output = {}

    for _,j in ipairs(jobs) do

        if(j.cmd == "" or j.cmd == nil) then
            vim.notify("Job command was empty", vim.log.levels.ERROR)
            break
        end

        table.insert(output, {
            name = j.name or "nap",
            data = vim.fn.system(j.cmd),
            after = j.after or nil,
            test = j.test or nil
        })

    end

    return output
end


local function async_run(jobData)
    local jobs = build(jobData)

    for _,j in ipairs(jobs) do

        if(j.cmd == "" or j.cmd == nil) then
            vim.notify("Job command was empty", vim.log.levels.ERROR)
            break
        end

        print(j.cmd)

        vim.fn.jobstart(
            j.cmd,
            {
                stdout_buffered = true,
                on_stdout = function(_, data, _)
                    display_response({
                        {
                            name = j.name or "nap",
                            data = data,
                            after = j.after or nil
                        }
                    })

                end,

                stderr_buffered = true,
                on_stderr = function (_, data, _)

                    if(next(data) == nil or data[1] == "") then
                        return
                    end

                    display_response({
                        {
                            name = "err_" .. j.name,
                            data = data,
                            after = nil
                        }
                    })

                end,

                on_exit = function()
                    vim.notify("exit")
                end,
            }
        )
    end
end


function M.run_and_test(jobData)
    local res = sync_run(jobData)
    display_test_results(run_tests(res))
end


function M.run_and_get(jobData)
    return sync_run(jobData)
end

function M.run_and_display(jobData)
    return async_run(jobData)
end

return M
